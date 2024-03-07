import 'package:economy_v2/app/core/app_config.dart';
import 'package:economy_v2/app/core/constants.dart';
import 'package:economy_v2/app/core/models/bill.dart';
import 'package:economy_v2/app/core/models/wallet.dart';
import 'package:economy_v2/app/core/utils/DateUtil.dart';
import 'package:economy_v2/app/core/utils/ValueUtil.dart';
import 'package:economy_v2/app/modules/home/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx/mobx.dart';

part 'widgets/home_header.dart';
part 'widgets/home_drawer.dart';
part 'widgets/home_header_row_values.dart';
part 'widgets/home_card_bill.dart';
part 'widgets/home_date_filter.dart';

class HomePage extends StatefulWidget {
  final Wallet wallet;
  const HomePage({super.key, required this.wallet});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    reaction((_) => controller.bills, (bills) {});
    

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      controller.setWalletValue(widget.wallet);  
      await controller.getAll();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.primaryColor,
      drawer: _HomeDrawer(controller: controller),
      appBar: AppBar(
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/bill/');
          await controller.getAll();
        },
        backgroundColor: AppConfig.secondaryColor,
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: Column(
              children: [
                Observer(
                  builder: (context) {
                    return Expanded(
                      flex: 1,
                      child: _HomeHeader(
                        totalBill: double.parse(
                            controller.totalBill.toStringAsFixed(2)),
                        totalRemaining: double.parse(
                            controller.totalRemaining.toStringAsFixed(2)),
                        totalWallet: double.parse(
                            widget.wallet.value.toStringAsFixed(2)),
                      ),
                    );
                  },
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                    ),
                    child: Column(
                      children: [
                        const _HomeDateFilter(),
                        Expanded(
                          child: Observer(
                            builder: (context) {
                              return ListView.builder(
                                shrinkWrap: false,
                                itemCount: controller.bills.length,
                                itemBuilder: (context, index) {
                                  final bill = controller.bills[index];
                                  return _HomeCardBill(
                                    bill: bill,
                                    onTapEdit: (context) async {
                                      await Navigator.of(context)
                                          .pushNamed('/bill', arguments: bill);
                                      await controller.getAll();
                                    },
                                    onTapDelete: (context) async {
                                      controller.deleteById(bill: bill);
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

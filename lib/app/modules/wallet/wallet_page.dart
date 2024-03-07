import 'package:asuka/core/consts.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:economy_v2/app/core/models/wallet.dart';
import 'package:economy_v2/app/core/utils/ValueUtil.dart';
import 'package:economy_v2/app/core/widgets/button_default.dart';
import 'package:economy_v2/app/core/widgets/text_form_field_default.dart';
import 'package:economy_v2/app/modules/wallet/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class WalletPage extends StatefulWidget {
  final Wallet? wallet;
  const WalletPage({super.key, this.wallet});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends ModularState<WalletPage, WalletController> {
  final _valueEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async { 
      _valueEC.text = widget.wallet?.value.toStringAsFixed(2) ?? "";
    });

    super.initState();
  }


  @override
  void dispose() {
    _valueEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualizar carteira'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 34),
          child: ListView(
            children: [
              TextFormFieldDefault(
                label: 'Valor R\$',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CentavosInputFormatter(),
                ],
                icon: Icons.attach_money_outlined,
                backgroundWhite: true,
                controller: _valueEC,
                type: const TextInputType.numberWithOptions(),
                validator: Validatorless.multiple([
                  Validatorless.min(0, 'Informe um valor correto'),
                  Validatorless.required('Campo obrigatório')
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonDefault(
                title: 'Confirmar',
                onPressed: () async {
                  final validate = _formKey.currentState?.validate() ?? false;
                  if (validate) {
                    
                    if (widget.wallet != null) {
                      widget.wallet!.value = ValueUtil.convertStringToDouble(_valueEC.text);
                      await controller.updateWallet(widget.wallet!);
                      Navigator.of(context).pop();
                    } else {
                      await controller.registerWallet(Wallet(
                          value:
                              ValueUtil.convertStringToDouble(_valueEC.text)));
                      Navigator.of(context).pushNamedAndRemoveUntil('/home/', (route) => false, arguments: widget.wallet ?? Wallet(value: ValueUtil.convertStringToDouble(_valueEC.text)) );        
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

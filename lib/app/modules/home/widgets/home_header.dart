part of '../home_page.dart';


class _HomeHeader extends StatefulWidget {
  final double totalWallet;
  final double totalBill;
  final double totalRemaining;

  const _HomeHeader({required this.totalWallet, required this.totalBill, required this.totalRemaining});

  @override
  State<_HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<_HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConfig.primaryColor,
      child:   Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, top: 10, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _HomeHeaderRowValues(title: 'Carteira', value: ValueUtil.convertDoubleToString(widget.totalWallet)),
            const SizedBox(height: 10,),
            _HomeHeaderRowValues(title: 'Despesas', value: ValueUtil.convertDoubleToString(widget.totalBill)),
            const SizedBox(height: 10,),
            _HomeHeaderRowValues(title: 'Restante', value: ValueUtil.convertDoubleToString(widget.totalRemaining)),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}

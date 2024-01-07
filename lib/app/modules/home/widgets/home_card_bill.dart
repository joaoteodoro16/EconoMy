part of '../home_page.dart';

class _HomeCardBill extends StatelessWidget {
  final Bill bill;
  final Function(BuildContext context) onTapEdit;
  final Function(BuildContext context) onTapDelete;

  const _HomeCardBill({required this.bill, required this.onTapEdit, required this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onTapDelete,
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Excluir',
          ),
          SlidableAction(
            onPressed: onTapEdit,
            backgroundColor: AppConfig.secondaryColor,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Editar',
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(
          'assets/images/green-dollar.png',
          height: 35,
        ),
        title: Text(bill.description),
        trailing: Text('R\$ ${ValueUtil.convertDoubleToString(bill.value)}', style: const TextStyle(fontSize: 17),),
        subtitle: Text(DateUtil.convertDateTimeForStringDate(bill.expireIn)),
      ),
    );
  }
}

part of '../home_page.dart';

class _HomeHeaderRowValues extends StatelessWidget {
  final String title;
  final String value;
  const _HomeHeaderRowValues({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title:',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Text(
          'R\$ $value',
          style: TextStyle(
            color: ValueUtil.convertStringToDouble(value) < 0 ? Colors.red : ValueUtil.convertStringToDouble(value) > 0 ?  Colors.green : Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

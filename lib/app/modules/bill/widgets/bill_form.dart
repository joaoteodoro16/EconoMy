part of '../bill_page.dart';

class _BillForm extends StatefulWidget {
   final Bill? billUpdate;
  const _BillForm({ super.key, this.billUpdate });

  @override
  State<_BillForm> createState() => _BillFormState();
}

class _BillFormState extends State<_BillForm> {

  final _formKey = GlobalKey<FormState>();
  var _descriptionEC = TextEditingController();
  var _valueEC = TextEditingController();
  var _obsEC = TextEditingController();
  var _dateEC = TextEditingController();
  var _discountEC = TextEditingController();

  @override
  void initState() {
    if (widget.billUpdate != null) {
      final bill = widget.billUpdate!;
      _descriptionEC = TextEditingController(text: bill.description);
      _valueEC = TextEditingController(
          text: ValueUtil.convertDoubleToString(bill.value));
      _obsEC = TextEditingController(text: bill.observation);
      _dateEC = TextEditingController(
          text: DateUtil.convertDateTimeFromPTBR(bill.expireIn));
      _discountEC = TextEditingController(
          text: ValueUtil.convertDoubleToString(bill.discount));
    } else {
      _dateEC = TextEditingController(
          text: DateUtil.convertDateTimeFromPTBR(DateTime.now()));
      _discountEC = TextEditingController(
          text: ValueUtil.convertDoubleToString(0));
    }
    super.initState();
  }

  @override
  void dispose() {
    _descriptionEC.dispose();
    _valueEC.dispose();
    _obsEC.dispose();
    _dateEC.dispose();
    _discountEC.dispose();
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {
       return Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormFieldDefault(
                label: 'Descrição',
                icon: Icons.description,
                backgroundWhite: true,
                controller: _descriptionEC,
                validator: Validatorless.required('Campo obrigatório'),
              ),
              const SizedBox(
                height: 10,
              ),
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
                height: 10,
              ),
               TextFormFieldDefault(
                label: 'Desconto R\$',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CentavosInputFormatter(),
                ],
                icon: Icons.attach_money_outlined,
                backgroundWhite: true,
                controller: _discountEC,
                type: const TextInputType.numberWithOptions(),
                validator: Validatorless.multiple([
                  Validatorless.min(0, 'Informe um desconto correto'),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormFieldDateDefault(
                controller: _dateEC,
                validator: Validatorless.required('Campo obrigatório'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormFieldDefault(
                label: 'Observação',
                icon: Icons.description,
                backgroundWhite: true,
                controller: _obsEC,
                validator: Validatorless.multiple([
                  Validatorless.max(
                      100, 'Número máximo de caracteres excedidos (100)'),
                ]),
              ),
            ],
          ),
        );
  }
}
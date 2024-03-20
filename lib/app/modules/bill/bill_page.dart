import 'package:brasil_fields/brasil_fields.dart';
import 'package:economy_v2/app/core/models/category.dart';
import 'package:economy_v2/app/core/utils/ValueUtil.dart';
import 'package:economy_v2/app/core/widgets/text_form_field_default.dart';
import 'package:economy_v2/app/modules/bill/bill_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/models/bill.dart';
import '../../core/utils/DateUtil.dart';
import '../../core/widgets/text_form_field_date_default.dart';

part 'widgets/bill_form.dart';

class BillPage extends StatefulWidget {
  final Bill? billUpdate;

  const BillPage({super.key, this.billUpdate});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends ModularState<BillPage, BillController> {
  final _formKey = GlobalKey<FormState>();
  var _descriptionEC = TextEditingController();
  var _valueEC = TextEditingController();
  var _obsEC = TextEditingController();
  var _dateEC = TextEditingController();
  var _discountEC = TextEditingController();
  final _repeatEC = TextEditingController();

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
    } else {
      _dateEC = TextEditingController(
          text: DateUtil.convertDateTimeFromPTBR(DateTime.now()));
      _discountEC =
          TextEditingController(text: ValueUtil.convertDoubleToString(0));
    }
    _repeatEC.text = "1";

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Cadastrar despesa'),
        actions: [
          IconButton(
            onPressed: () async {
              final validate = _formKey.currentState?.validate() ?? false;
              if (validate) {
                final bill = _fillObjectBill();

                if (widget.billUpdate != null) {
                  await controller.updateBill(bill: bill);
                } else {
                  await controller.createBill(
                      bill: bill, repeatNum: int.parse(_repeatEC.text));
                }
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(
              Icons.done,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Form(
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
              const SizedBox(
                height: 10,
              ),
              widget.billUpdate == null
                  ? TextFormFieldDefault(
                      label: 'Repetir quantas vezes?',
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      icon: Icons.repeat,
                      backgroundWhite: true,
                      controller: _repeatEC,
                      type: const TextInputType.numberWithOptions(),
                      validator: Validatorless.multiple([
                        Validatorless.min(0, 'Informe um valor correto'),
                        Validatorless.required('Campo obrigatório')
                      ]),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Bill _fillObjectBill() {
    return Bill(
        id: widget.billUpdate?.id,
        description: _descriptionEC.text,
        value: ValueUtil.convertStringToDouble(_valueEC.text),
        expireIn: DateUtil.convertStringToDate(_dateEC.text),
        observation: _obsEC.text);
  }
}

import 'package:economy_v2/app/core/app_config.dart';
import 'package:economy_v2/app/core/utils/DateUtil.dart';
import 'package:economy_v2/app/core/utils/MaskUtil.dart';
import 'package:economy_v2/app/core/widgets/text_form_field_default.dart';
import 'package:flutter/material.dart';

class TextFormFieldDateDefault extends StatefulWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  const TextFormFieldDateDefault({super.key, this.controller, this.validator});

  @override
  State<TextFormFieldDateDefault> createState() =>
      _TextFormFieldDateDefaultState();
}

class _TextFormFieldDateDefaultState extends State<TextFormFieldDateDefault> {
  

  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: TextFormFieldDefault(
              controller: widget.controller,
              validator: widget.validator,
              label: 'Data de vencimento',
              icon: Icons.date_range_rounded,
              backgroundWhite: true,
              type: TextInputType.number,
              inputFormatters: [MaskUtil.maskDateFormat],
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppConfig.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                _selectDate(context);
              },
              child: const Icon(
                Icons.date_range,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateUtil.convertStringToDate(widget.controller!.text),
      firstDate: DateTime(2023),
      lastDate: DateTime(2033),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppConfig.primaryColor,
            colorScheme: ColorScheme.light(primary: AppConfig.primaryColor),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        widget.controller!.text = DateUtil.convertDateTimeFromPTBR(picked);
      });
    }
  }
}

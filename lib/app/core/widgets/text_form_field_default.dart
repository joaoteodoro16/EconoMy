import 'package:economy_v2/app/core/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldDefault extends StatelessWidget {
  final String label;
  final bool? isPassword;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool? backgroundWhite;
  final IconData icon;
  final TextInputType? type;
  final List<TextInputFormatter>? inputFormatters;


  const TextFormFieldDefault(
      {super.key,
      required this.label,
      this.isPassword,
      this.controller,
      this.validator, this.backgroundWhite = false,required this.icon, this.type, this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      inputFormatters: inputFormatters,
      obscureText: isPassword ?? false,
      keyboardType: type ?? TextInputType.text,
      cursorColor: backgroundWhite! ? Colors.black  : Colors.white,
      style: TextStyle(color: backgroundWhite! ? Colors.black  : Colors.white),
      decoration: InputDecoration(
        isCollapsed: false,
        labelText: label,
        prefixIcon: Icon(icon),
        prefixIconColor: backgroundWhite! ? AppConfig.primaryColor : Colors.white,
        labelStyle: TextStyle(color: backgroundWhite! ? Colors.black  : Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppConfig.darkPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: backgroundWhite! ? Colors.black  : Colors.white),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

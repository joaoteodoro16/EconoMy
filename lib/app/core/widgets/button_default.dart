import 'package:economy_v2/app/core/app_config.dart';
import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final String title;
  final double? height;
  final double? titleSize;
  final Color? colorTitle;

  const ButtonDefault(
      {super.key,
      this.onPressed,
      this.color,
      required this.title,
      this.height,
      this.titleSize,
      this.colorTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? AppConfig.secondaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: titleSize ?? 16,
            color: colorTitle ?? Colors.white,
          ),
        ),
      ),
    );
  }
}

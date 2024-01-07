
import 'package:flutter/material.dart';

class AppConfig {
  
  AppConfig._();

  static Color get primaryColor => const Color(0xff264653);
  static Color get darkPrimaryColor => const Color(0xff14282F);
  static Color get secondaryColor => const Color(0xff2a9d8f);
  static Color get yellowColor => const Color(0xffe9c46a);
  static Color get orangeColor => const Color(0xfff4a261);
  static Color get darkOrangeColor => const Color(0xffe76f51);


  static ThemeData get theme => ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppConfig.primaryColor,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white
      )
      
    )
  );

}
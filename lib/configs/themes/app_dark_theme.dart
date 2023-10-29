import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_quiz_app/configs/themes/app_light_theme.dart';
import 'package:mobile_quiz_app/configs/themes/sub_theme_data_mixin.dart';

const Color primaryDarkColorDark = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);
const Color mainTextColordark = Color.fromARGB(255, 255, 255, 255);


class DarkTheme with SubThemeData{
  buildDarkTheme(){
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme
    .copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
        bodyColor: mainTextColordark,
        displayColor: mainTextColordark,
      ),
    );
  }
}
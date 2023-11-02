import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_quiz_app/configs/themes/app_dark_theme.dart';
import 'package:mobile_quiz_app/configs/themes/app_light_theme.dart';
import 'package:mobile_quiz_app/configs/themes/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradienLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightColorLight,
    primaryColorLight,
  ]  
);

const mainGradienDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryDarkColorDark,
    primaryColorDark,
  ]  
);

LinearGradient mainGradient() =>
  UIParameters.isDarkMode() ? mainGradienDark : mainGradienLight;


Color customScaffoldColor(BuildContext context) => 
  UIParameters.isDarkMode()? const Color(0xFF2e3c62)
  : const Color.fromARGB(255, 240, 237, 255); 
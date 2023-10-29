import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_quiz_app/configs/themes/ui_parameters.dart';


TextStyle cartTitles(context) => TextStyle(
  color: UIParameters.isDarkMode()? Theme.of(context).textTheme.bodyText1!.color
  :Theme.of(context).primaryColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
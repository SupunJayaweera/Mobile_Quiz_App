import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static const String routeName = "/resultscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Result here "),
      ),
    );
  }
}

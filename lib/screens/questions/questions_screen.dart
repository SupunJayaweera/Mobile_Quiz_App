import 'package:flutter/material.dart';
import 'package:mobile_quiz_app/controllers/question_paper/questions_controller.dart';
import 'package:mobile_quiz_app/widgets/common/background_decoration.dart';
import 'package:get/get.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});

  static const String routeName = "/questionsscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Center(child: Text("I am here")),
      ),
    );
  }
}

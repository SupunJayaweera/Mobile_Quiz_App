import 'package:flutter/material.dart';
import 'package:mobile_quiz_app/controllers/question_paper/questions_controller.dart';
import 'package:mobile_quiz_app/firebase_ref/loading_status.dart';
import 'package:mobile_quiz_app/widgets/common/background_decoration.dart';
import 'package:get/get.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});

  static const String routeName = "/questionsscreen";

  @override
  Widget build(BuildContext context) {
    print("qwe");
    print(controller.currentQuestion);
    print("Asd");
    return Scaffold(
      body: BackgroundDecoration(
          child: Center(
              child: Obx(() => Column(children: [
                    if (controller.loadingStatus.value == LoadingStatus.loading)
                      const Expanded(child: CircularProgressIndicator()),
                    if (controller.loadingStatus.value ==
                        LoadingStatus.completed)
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(
                        children: [
                          Text(
                            controller.currentQuestion.value!.question,
                          )
                        ],
                      )))
                  ])))),
    );
  }
}

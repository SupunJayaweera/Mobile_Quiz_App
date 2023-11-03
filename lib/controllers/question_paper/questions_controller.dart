import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mobile_quiz_app/firebase_ref/references.dart';
import 'package:mobile_quiz_app/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionsController extends GetxController {
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];
  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;

    print(_questionPaper.id);

    loadData(_questionPaper);

    super.onReady();
  }

  Future<void> loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF
              .doc(questionPaper.id)
              .collection("questions")
              .get();

      final questions = questionQuery.docs
          .map((snapshot) => Questions.fromSnapshot(snapshot))
          .toList();

      questionPaper.questions = questions;

      for (Questions _question in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await questionPaperRF
                .doc(questionPaper.id)
                .collection("questions")
                .doc(_question.id)
                .collection("answers")
                .get();

        final answers = answersQuery.docs
            .map((answer) => Answers.fromSnapshot(answer))
            .toList();
        _question.answers = answers;
        if (questionPaper.questions != null &&
            questionPaper.questions!.isNotEmpty) {
          allQuestions.assignAll(questionPaper.questions!);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

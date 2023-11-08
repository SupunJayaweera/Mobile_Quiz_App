import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mobile_quiz_app/firebase_ref/loading_status.dart';
import 'package:mobile_quiz_app/firebase_ref/references.dart';
import 'package:mobile_quiz_app/models/question_paper_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionsController extends GetxController {
  final loadingStatus = LoadingStatus.loading.obs;
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];
  Rxn<Questions> currentQuestion = Rxn<Questions>();
  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;

    print(_questionPaper.id); // not printing

    loadData(_questionPaper);

    super.onReady();
  }

  Future<void> loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    loadingStatus.value = LoadingStatus.loading;

    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF
              .doc(questionPaper.id)
              .collection("questions")
              .get();

      final questions = questionQuery.docs
          .map((snapshot) => Questions.fromSnapshot(snapshot))
          .toList();

      questionPaper.questions = questions; // till here ok

      for (Questions _question in questionPaper.questions!) {
        // ok
        print("abc");
        print(_question);
        print("efg");
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await questionPaperRF
                .doc(questionPaper.id)
                .collection("question")
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

          currentQuestion.value = questionPaper.questions![0];

          if (kDebugMode) {
            print("llll");
            print(questionPaper.questions![0].question);
            print("llll");
          }

          loadingStatus.value = LoadingStatus.completed;
        } else {
          loadingStatus.value = LoadingStatus.error;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

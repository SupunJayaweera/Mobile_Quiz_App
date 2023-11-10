import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_quiz_app/configs/themes/app_colors.dart';
import 'package:mobile_quiz_app/configs/themes/ui_parameters.dart';

enum AnswerStatus {
  correct,
  wrong,
  answered,
  notanswered,
}

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  const AnswerCard(
      {super.key,
      required this.answer,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected ? onSurfaceTextColor : null,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? answerSelectedColor() : answerBorderColor(),
            ),
            borderRadius: UIParameters.cardBorderRadius,
            color: isSelected
                ? answerSelectedColor()
                : Theme.of(context).cardColor),
      ),
    );
  }
}

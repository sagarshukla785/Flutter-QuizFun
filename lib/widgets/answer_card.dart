import 'package:flutter/material.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:quizfun/widgets/circular_icon.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final bool isCorrect;
  final bool isDisplayingAnswer;
  final VoidCallback tap;
  const AnswerCard({
    Key? key,
    required this.answer,
    required this.isSelected,
    required this.isCorrect,
    required this.isDisplayingAnswer,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: isDisplayingAnswer
                ? isCorrect
                    ? Colors.green
                    : isSelected
                        ? Colors.red
                        : Colors.black
                : isCorrect
                    ? isSelected
                        ? Colors.green
                        : Colors.black
                    : Colors.black,
            width: 4.0,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  HtmlCharacterEntities.decode(answer),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (isDisplayingAnswer)
              isCorrect
                  ? CircularIcon(icon: Icons.check, color: Colors.green)
                  : isSelected
                      ? CircularIcon(
                          icon: Icons.close,
                          color: Colors.red,
                        )
                      : SizedBox.shrink(),
            if (!isDisplayingAnswer)
              isCorrect
                  ? isSelected
                      ? CircularIcon(
                          icon: Icons.check,
                          color: Colors.green,
                        )
                      : SizedBox.shrink()
                  : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

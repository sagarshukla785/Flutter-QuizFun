import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:html_character_entities/html_character_entities.dart';
import 'package:quizfun/controllers/quiz/quiz_controller.dart';
import 'package:quizfun/controllers/quiz/quiz_sate.dart';
import 'package:quizfun/models/question_model.dart';
import 'answer_card.dart';

class QuizQuestion extends StatelessWidget {
  final QuizState quizState;
  final PageController pageController;
  final List<Question> questions;
  const QuizQuestion({
    Key? key,
    required this.quizState,
    required this.pageController,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) {
          final question = questions[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Question ${index + 1} of ${questions.length}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 12),
                  child: Text(
                    HtmlCharacterEntities.decode(question.question),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                child: Divider(
                  color: Colors.black,
                  height: 30,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
              Container(
                child: Column(
                  children: question.answer
                      .map(
                        (e) => AnswerCard(
                          answer: e,
                          isCorrect: e == question.correctAnswer,
                          isDisplayingAnswer: e == quizState.selectedAnswer,
                          isSelected: quizState.answered,
                          tap: () => context
                              .read(quizControllerProvider.notifier)
                              .submitAnswer(question, e),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          );
        });
  }
}

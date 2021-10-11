import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:quizfun/controllers/quiz/quiz_controller.dart';
import 'package:quizfun/controllers/quiz/quiz_sate.dart';
import 'package:quizfun/models/question_model.dart';
import 'package:quizfun/repositories/quiz/quiz_repository.dart';
import 'package:quizfun/widgets/custom_button.dart';

class QuizResults extends StatelessWidget {
  final QuizState quizState;
  final List<Question> question;
  const QuizResults({
    Key? key,
    required this.quizState,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${quizState.correct.length} / ${question.length}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Correct',
          style: TextStyle(
            color: Colors.black,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        CustomButton(
          title: 'New Quiz',
          tap: () {
            context.refresh(quizRepositoryProvider);
            context.read(quizControllerProvider.notifier).reset();
          },
        )
      ],
    );
  }
}

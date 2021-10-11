import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizfun/controllers/quiz/quiz_controller.dart';
import 'package:quizfun/controllers/quiz/quiz_sate.dart';
import 'package:quizfun/models/question_model.dart';
import 'package:quizfun/screens/quiz_error_screen.dart';
import 'package:quizfun/widgets/quiz_questions.dart';
import 'package:quizfun/widgets/quiz_results.dart';

class BuildBody {
  Widget buildBody(
    BuildContext context,
    PageController pageController,
    List<Question> questions,
  ) {
    if (questions.isEmpty)
      return QuizError(message: "No Questions Found!");
    else {
      final quizState = useProvider(quizControllerProvider);
      return quizState.status == QuizStatus.complete
          ? QuizResults(
              quizState: quizState,
              question: questions,
            )
          : QuizQuestion(
              pageController: pageController,
              questions: questions,
              quizState: quizState,
            );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizfun/controllers/quiz/quiz_controller.dart';
import 'package:quizfun/enums/difficulty.dart';
import 'package:quizfun/models/question_model.dart';
import 'package:quizfun/repositories/quiz/quiz_repository.dart';
import 'package:quizfun/widgets/body.dart';
import 'package:quizfun/widgets/custom_button.dart';
import 'quiz_error_screen.dart';

final quizQuestionsProvider = FutureProvider.autoDispose<List<Question>>(
  (ref) => ref.watch(quizRepositoryProvider).getQuestions(
        numQuestion: 5,
        categoryId: 10,
        difficulty: Difficulty.any,
      ),
);

class QuizScreen extends HookWidget {
  BuildBody buildBody = BuildBody();
  @override
  Widget build(BuildContext context) {
    final quizQuestions = useProvider(quizQuestionsProvider);
    final pageController = usePageController();
    final quizState = useProvider(quizControllerProvider);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: Colors.yellow,
        body: quizQuestions.when(
          data: (questions) => buildBody.buildBody(
            context,
            pageController,
            questions,
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          ),
          error: (error, _) => QuizError(
            message: "Something went wrong",
          ),
        ),
        bottomSheet: quizQuestions.maybeWhen(
            data: (questions) {
              final quizState = useProvider(quizControllerProvider);
              if (!quizState.answered) {
                return const SizedBox.shrink();
              } else {
                return CustomButton(
                  title: pageController.page!.toInt() + 1 < questions.length
                      ? "Next Question"
                      : "See Results",
                  tap: () {
                    context
                        .read(quizControllerProvider.notifier)
                        .nextQuestion(questions, pageController.page!.toInt());
                    if (pageController.page!.toInt() + 1 < questions.length) {
                      pageController.nextPage(
                        duration: const Duration(microseconds: 250),
                        curve: Curves.linear,
                      );
                    }
                  },
                );
              }
            },
            orElse: () => SizedBox.shrink()),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizfun/controllers/quiz/quiz_sate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizfun/models/question_model.dart';

final quizControllerProvider = StateNotifierProvider(
  (ref) => QuizController(),
);

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState.initial());
  List<Color> colors = [
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.brown
  ];

  void submitAnswer(Question currentQuestion, String answer) {
    if (state.answered) return;
    if (currentQuestion.correctAnswer == answer) {
      state = state.copyWith(
        selectedAnswer: answer,
        correct: state.correct..add(currentQuestion),
        status: QuizStatus.correct,
        incorrect: state.incorrect,
      );
    } else {
      state = state.copyWith(
        selectedAnswer: answer,
        correct: state.correct,
        incorrect: state.incorrect..add(currentQuestion),
        status: QuizStatus.incorrect,
      );
    }
  }

  void nextQuestion(List<Question> questions, int currentIndex) {
    state = state.copyWith(
      selectedAnswer: '',
      correct: state.correct,
      incorrect: state.incorrect,
      status: currentIndex + 1 < questions.length
          ? QuizStatus.initial
          : QuizStatus.complete,
    );
  }

  void reset() {
    state = QuizState.initial();
  }
}

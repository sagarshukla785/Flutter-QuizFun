import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quizfun/models/question_model.dart';

enum QuizStatus { initial, correct, incorrect, complete }

class QuizState extends Equatable {
  final String selectedAnswer;
  final List<Question> correct;
  final List<Question> incorrect;
  final QuizStatus status;

  QuizState({
    required this.selectedAnswer,
    required this.correct,
    required this.incorrect,
    required this.status,
  });

  bool get answered =>
      status == QuizStatus.incorrect || status == QuizStatus.correct;

  factory QuizState.initial() {
    return QuizState(
      selectedAnswer: '',
      correct: [],
      incorrect: [],
      status: QuizStatus.initial,
    );
  }
  @override
  List<Object?> get props => [
        selectedAnswer,
        correct,
        incorrect,
        status,
      ];

  QuizState copyWith({
    required String selectedAnswer,
    required List<Question> correct,
    required List<Question> incorrect,
    required QuizStatus status,
  }) {
    return QuizState(
      selectedAnswer: selectedAnswer,
      correct: correct,
      incorrect: incorrect,
      status: status,
    );
  }
}

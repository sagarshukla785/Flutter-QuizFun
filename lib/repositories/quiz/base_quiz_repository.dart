import 'package:quizfun/models/question_model.dart';
import 'package:quizfun/enums/difficulty.dart';

abstract class BaseQuizRepository {
  Future<List<Question>> getQuestions({
    required int numQuestion,
    required int categoryId,
    required Difficulty difficulty,
  });
}

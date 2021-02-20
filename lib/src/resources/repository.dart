import 'dart:async';
import 'package:conection_api_admision/src/models/prueba_model_item.dart';

import 'question_api_provider.dart';

class Repository {
  final questionApiProvider = QuestionApiProvider();

  Future<QuestionModel> fetchAllQuestion() =>
  questionApiProvider.fetchQuestionList();
}

class NetworkError extends Error {}
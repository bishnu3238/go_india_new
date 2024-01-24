import 'package:flutter/cupertino.dart';

import '../../domain/entity/others/quiz.dart';

abstract class QuizEvent {}

class QuizFetchEvent extends QuizEvent {
  QuizFetchEvent();
}

class QuizReadyToPlayEvent extends QuizEvent {}

class NextQuizEvent extends QuizEvent {}

class CheckQuizAnswer extends QuizEvent {
  final Quizzes quiz;
  final int index;
  CheckQuizAnswer({required this.index, required this.quiz});
}

class UpdateQuestionIndex extends QuizEvent {
  final int index;
  UpdateQuestionIndex(this.index);
}

class UpdateNoOfCorrectAns extends QuizEvent{}
class PreviousQuizEvent extends QuizEvent{}

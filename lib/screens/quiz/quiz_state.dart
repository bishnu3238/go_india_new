import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:go_india/domain/entity/entity.dart';
import 'package:go_india/utility/constant/constant.dart';

enum QuizStatus { initial, inProgress, error, stop, done }

class QuizState {
  final QuizStatus status;
  final List<Quizzes> quizzes;
  final PageController pageController;
  final int currentQuestionIndex;
  final bool isAnswered;
  final int numberOfCorrectAnswer;

  QuizState({
    this.quizzes = const [],
    this.status = QuizStatus.initial,
    required this.pageController,
    this.currentQuestionIndex = 1,
    this.isAnswered = false,
    this.numberOfCorrectAnswer = 0,
  });

  QuizState copyWith({
    QuizStatus? status,
    List<Quizzes>? quizzes,
    PageController? pageController,
    int? currentQuestionIndex,
    int ? numberOfCorrectAnswer,
    bool? isAnswered,
  }) =>
      QuizState(
        status: status ?? this.status,
        quizzes: quizzes ?? this.quizzes,
        isAnswered: isAnswered ?? this.isAnswered,

        pageController: pageController ?? this.pageController,
        currentQuestionIndex: currentQuestionIndex?? this.currentQuestionIndex,
          numberOfCorrectAnswer: numberOfCorrectAnswer?? this.numberOfCorrectAnswer,
      );
}

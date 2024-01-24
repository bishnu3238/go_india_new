import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_india/domain/repository/master_repository.dart';
import 'package:go_india/package/common/common.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/utility/utility/utility.dart';

import 'export.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc(this._masterRepository)
      : super(QuizState(pageController: PageController(initialPage: 0))) {
    on<QuizFetchEvent>(_quizInitialize);
    on<QuizReadyToPlayEvent>(_quizPlayed);
    on<NextQuizEvent>(_nextQuiz);
    on<CheckQuizAnswer>(_checkAnswer);
    on<UpdateQuestionIndex>(_updateQuestionIndex);
    on<UpdateNoOfCorrectAns>(_updateNoOfCorrectAns);
    on<PreviousQuizEvent>(_previousQuiz);
  }

  final MasterRepository _masterRepository;

  FutureOr<void> _quizInitialize(
      QuizFetchEvent event, Emitter<QuizState> emit) async {
    await _masterRepository.getQuiz().then((value) => value.fold(
          (l) => null,
          (r) => emit(state.copyWith(quizzes: r)),
        ));
  }

  FutureOr<void> _quizPlayed(
      QuizReadyToPlayEvent event, Emitter<QuizState> emit) {
    emit(state.copyWith(status: QuizStatus.inProgress));
  }

  FutureOr<void> _nextQuiz(NextQuizEvent event, Emitter<QuizState> emit) {
    if (state.pageController.page!.round()+1 != state.quizzes.length) {
      emit(state.copyWith(isAnswered: false));
      state.pageController
          .nextPage(duration: twoMilliSecond, curve: Curves.bounceIn);
      add((UpdateQuestionIndex(state.pageController.page!.round())));

      // animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
    } else {
      // Get package provide us simple way to navigate another page
      emit(state.copyWith(status: QuizStatus.done));
    }
  }

  FutureOr<void> _checkAnswer(CheckQuizAnswer event, Emitter<QuizState> emit) {
    emit(state.copyWith(isAnswered: true));
    var correctAns = event.quiz.asn;
    if (correctAns == event.quiz.options[event.index]) {
      add(UpdateNoOfCorrectAns());
    } else {
      false.log();
    }

    /*stop animation progress, and reset animation, go to next question;*/
    add(NextQuizEvent());
  }

  FutureOr<void> _updateQuestionIndex(
      UpdateQuestionIndex event, Emitter<QuizState> emit) {
    emit(state.copyWith(currentQuestionIndex: event.index));
  }

  FutureOr<void> _updateNoOfCorrectAns(
      UpdateNoOfCorrectAns event, Emitter<QuizState> emit) {
    emit(
        state.copyWith(numberOfCorrectAnswer: state.numberOfCorrectAnswer + 1));
  }

  FutureOr<void> _previousQuiz(
      PreviousQuizEvent event, Emitter<QuizState> emit) {
    state.pageController
        .previousPage(duration: twoMilliSecond, curve: Curves.easeIn);
  }
}

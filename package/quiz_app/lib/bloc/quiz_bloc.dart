 import 'package:go_india/domain/repository/master_repository.dart';
 import 'package:quiz_app/bloc/quiz_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/Questions.dart';

class QuizBloc extends Cubit<QuizState> {
  QuizBloc(this._masterRepository) : super(QuizInitialState());
  MasterRepository _masterRepository;
  Future getQuizzes() async {
    await _masterRepository.getQuiz().then(
          (value) => value.fold(
            (l) => null,
            (r) {
              List<Question> question = [];
              emit(QuizFetchedState(question));
            },
          ),
        );
  }
}

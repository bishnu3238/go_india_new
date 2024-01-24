import '../models/Questions.dart';

abstract class QuizState{}
class QuizInitialState extends QuizState{

}

class QuizFetchedState extends QuizState{

  List<Question> question;
  QuizFetchedState(this.question);


}
class QuizFetchFailedState extends QuizState{}

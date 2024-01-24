import 'package:go_india/domain/entity/entity.dart';
import 'package:go_india/screens/quiz/export.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';

class QuizScreenRoute {
  static GoRoute subPage() => GoRoute(
      path: Screen.quiz.subPath,
      name: Screen.quiz.subCName,
      builder: (ctx, state) => const QuizScreen()

      // quizzes: state.extra as List<Quizzes>),
      );
}

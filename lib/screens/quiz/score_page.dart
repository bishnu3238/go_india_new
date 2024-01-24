import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/custom_button/el_button.dart';
import 'package:go_india/screens/quiz/export.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_india/domain/entity/entity.dart';
import 'package:go_india/screens/quiz/export.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_path.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key, required this.bloc});
  final QuizBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                state as QuizState;
                return Column(
                  children: [
                    const Spacer(flex: 3),
                    Text(
                      "Score",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: kSecondaryColor),
                    ),
                    const Spacer(),
                    Text(
                      "${state.numberOfCorrectAnswer}/${state.quizzes.length}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: kSecondaryColor),
                    ),
                    const Spacer(flex: 3),
                    ElButton(
                      text: 'Done',
                      padding: edgeInsets1505,
                      onTap: () => context.pop(),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ScoreScreenRoute {
  static GoRoute subPage() => GoRoute(
        path: Screen.score.subPath,
        name: Screen.score.subCName,
        builder: (ctx, state) => ScoreScreen(bloc: state.extra as QuizBloc),

        // quizzes: state.extra as List<Quizzes>),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_india/domain/entity/others/quiz.dart';
import 'package:go_india/routes/route_path.dart';
import 'package:go_india/screens/quiz/quiz_bloc.dart';
import 'package:go_india/screens/quiz/quiz_event.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:quiz_app/main.dart';
import '../../package/package/package.dart';
import 'component/body.dart';
import 'component/quiz_screen_button.dart';
import 'export.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizBloc(get.get())..add(QuizFetchEvent()),
      child: Builder(builder: (context) {
        var bloc = context.read<QuizBloc>();
        return BlocConsumer<QuizBloc, QuizState>(listener: (context, state) {
          if (state.status == QuizStatus.done) {
            Screen.score.go(context, extra: bloc);
          }
        }, builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: _simpleAppBar(context),
            body: const Body(),
            // persistentFooterButtons: const [QuizScreenButton()],
          );
        });
      }),
    );
  }
}

SimpleAppBar _simpleAppBar(BuildContext context) {
  var theme = Theme.of(context);
  var bloc = context.read<QuizBloc>();
  return SimpleAppBar(
    bgColor: theme.canvasColor.withAlpha(0),
    iconTheme: theme.iconTheme.copyWith(color: theme.colorScheme.secondary),
    buttons: [
      FavTextIcon(
        onTap: () => bloc.add(NextQuizEvent()),
        label: "Skip",
        isReversed: true,
        size: 15,
        icon: FontAwesomeIcons.arrowRight,
        iconColor: theme.canvasColor.withAlpha(200),
        style: gideonRoman(color: theme.colorScheme.tertiaryContainer),
      ),
    ],
  );
}

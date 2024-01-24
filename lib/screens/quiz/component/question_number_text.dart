
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utility/constant/constant.dart';
import '../export.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber({
    super.key,
    required this.theme,
  });

  final ThemeData theme;


  @override
  Widget build(BuildContext context) {
    var state = context.read<QuizBloc>().state;
    return Padding(
      padding: edgeInsets10,
      child: Text.rich(
        TextSpan(
          text: "Question ",
          style:
          roboto(color: theme.colorScheme.secondary, size: 20),
          children: [
            TextSpan(
              text: "${state.pageController.page!.round() +1}",
              style: roboto(
                  color: theme.colorScheme.tertiary,
                  size: 22,
                  weight: fw9),
            ),
            TextSpan(
              text: "/${state.quizzes.length}",
              style: roboto(
                  color: theme.colorScheme.secondary,
                  size: 22,
                  weight: fw9),
            ),
          ],
        ),
      ),
    );
  }
}

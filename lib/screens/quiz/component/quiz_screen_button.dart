import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_india/domain/entity/entity.dart';
import 'package:go_india/package/package/package.dart';
import 'package:quiz_app/main.dart';

import '../../../../../routes/route_path.dart';
import '../../../../../utility/utility/utility.dart';
import '../export.dart';

class QuizScreenButton extends StatelessWidget {
  const QuizScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        var bloc = context.watch<QuizBloc>();
        return Row(
          // direction: Axis.horizontal,
          children: [
            state.currentQuestionIndex != 0
                ? Expanded(
                    child: ElButton(
                      text: 'Previous',
                      style: gideonRoman(color: kGolden, weight: fw9),
                      onTap: () => bloc.add(PreviousQuizEvent()),
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: ElButton(
                text: 'Next',
                style: gideonRoman(color: kGolden, weight: fw9),
                onTap:  () => bloc.add(NextQuizEvent())

              ),
            ),
          ],
        );
      },
    );
  }
}

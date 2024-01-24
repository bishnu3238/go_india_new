import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/screens/quiz/component/quiz_screen_button.dart';
import 'package:go_india/screens/quiz/export.dart';

import '../../../domain/entity/entity.dart';
import '../../../utility/constant/constant.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.question}) : super(key: key);

  final Quizzes question;

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<QuizBloc>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(color: kDark),
          ),
          const SizedBox(height: 20 / 2),
          ...List.generate(
            question.options.length,
            (index) => Options(
              index: index,
              text: question.options[index],
              press: () => bloc.add(
                CheckQuizAnswer(quiz: question, index: index),
              ),
              // press: () => _controller.checkAns(question, index),
            ),
          ),
          const Spacer(flex: 1),
          const QuizScreenButton(),
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
      var que = state.quizzes[state.currentQuestionIndex];
      Color getTheRightColor() {
        if (state.isAnswered) {
          if (que.options[index] == que.asn) return kGreenColor;
          return kRedColor;
        }
        return kGrayColor;
      }

      IconData getTheRightIcon() {
        return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
      }

      return InkWell(
        onTap: press,
        child: Container(
          margin: edgeInsetsT20,
          padding: edgeInsets20,
          decoration: BoxDecoration(
            border: Border.all(color: getTheRightColor()),
            borderRadius: radius12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${index + 1}. $text",
                style: TextStyle(color: getTheRightColor(), fontSize: 16),
              ),
            ],
          ),
        ),
      );
    });
  }
}

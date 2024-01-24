import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_india/screens/quiz/export.dart';

import '../../../routes/route_path.dart';
import '../../../utility/constant/constant.dart';
import 'options_card.dart';
import 'progress_bar.dart';
import 'question_number_text.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: oneSecond);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController
        .forward()
        .whenComplete(() => _animationController.stop());
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    if (mounted) context.read<QuizBloc>().state.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var bloc = context.read<QuizBloc>();

    return Stack(
      children: [
        SvgPicture.asset(bgImage, fit: BoxFit.fill),
        BlocBuilder<QuizBloc, QuizState>( builder: (context, state) {
          var bloc = context.read<QuizBloc>();
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: edgeInsets10,
                //   child: ProgressBar(animation: _animation),
                // ),
                const SizedBox(height: 20),
                QuestionNumber(theme: theme),
                Divider(thickness: 1.5, color: theme.colorScheme.background),
                const SizedBox(height: 20),
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: state.pageController,
                    onPageChanged: (int i) => bloc.add(UpdateQuestionIndex(i)),
                    itemCount: state.quizzes.length,
                    itemBuilder: (context, index) =>
                        QuestionCard(question: state.quizzes[index]),
                  ),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}

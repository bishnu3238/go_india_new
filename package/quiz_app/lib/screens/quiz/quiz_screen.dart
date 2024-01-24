import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_india/package/custom_widget/custom_widgets.dart';
import 'package:go_india/utility/constant/colors.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    _controller.questions = quizzes;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SimpleAppBar(
        elevation: 0,
        bgColor: kLight,
        buttons: [
          FavTextIcon(
            onTap: _controller.nextQuestion,
            label: "Skip",
            isReversed: true,
            icon: FontAwesomeIcons.sliders,
          ),
        ],
      ),
      body: Body(),
    );
  }
}

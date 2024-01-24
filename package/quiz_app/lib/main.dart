import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:go_india/domain/store/store.dart';
import 'package:go_india/utility/utility/utility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india/package/package/package.dart';
import 'package:go_india/routes/route_path.dart';

import 'package:go_router/go_router.dart';
import 'bloc/quiz_bloc.dart';
import 'models/Questions.dart';
import 'screens/quiz/quiz_screen.dart';

/// 29/09/2023
//  TODO: modify this package -
//  make this package to use in any project;

List<Question> quizzes = [];

class QuizApp extends StatelessWidget {
  // This widget is the root of your application.
  const QuizApp({Key? key, required this.questions}) : super(key: key);
  final List<Question> questions;
  @override
  Widget build(BuildContext context) {
    quizzes = this.questions;
    'Quizzes : $quizzes'.log();
    return BlocBuilder<ThemeStore, ThemeState>(
      bloc: get<ThemeStore>(),
      builder: (context, state) {
        return GetMaterialApp(
          title: 'Quiz App',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: state.light.toTheme,
          darkTheme: state.dark.toTheme,
          home:  WelcomeScreen(),
        );
      },
    );
  }
}
 

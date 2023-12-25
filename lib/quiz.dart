import 'package:quizz_app/models/questions.dart';
import 'package:quizz_app/questions_screens.dart';
import 'package:quizz_app/result_screen.dart';
import 'package:quizz_app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen(String selectedScreen) {
    setState(() {
      if (selectedScreen == 'start-screen') {
        selectedAnswer = [];
      }
      activeScreen = selectedScreen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswer, switchScreen);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(selectedAnswer, switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 115, 60, 210),
                Color.fromARGB(255, 219, 72, 214)
              ], begin: Alignment.topLeft),
            ),
            child: screenWidget
            ),
      ),
    );
  }
}

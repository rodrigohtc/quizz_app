// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/models/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.chooseAnswer, this.showResult, {super.key});

  final void Function(String answer) chooseAnswer;
  final void Function(String selectedScreen) showResult;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.chooseAnswer(answer);
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        widget.showResult('result-screen');
      }
    });
  }

  @override
  Widget build(context) {
    final current = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              current.text,
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ...current.getShuffledAnswers().map((answer) {
              return AnswerButoon(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizz_app/models/questions.dart';
import 'package:quizz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.selectedsAnswer, this.startQuiz, {super.key});

  final void Function(String selectedScreen) startQuiz;
  final List<String> selectedsAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedsAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers.first,
          'user_answer': selectedsAnswer[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final correctQuestions = getSummaryData().where((data) {
      return data['correct_answer'] == data['user_answer'];
    });

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Você acertou ${correctQuestions.length} de $totalQuestions questões!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center
            ),
            const SizedBox(height: 16),
            QuestionSummary(getSummaryData()),
            const SizedBox(height: 16),
            TextButton.icon(
            onPressed: () {
              startQuiz('start-screen');
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.restart_alt_outlined),
            label: const Text('Recomeçar!'),
          ),
          ],
        ),
      ),
    );
  }
}

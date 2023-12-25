import 'package:flutter/material.dart';

class AnswerButoon extends StatelessWidget{
  const AnswerButoon({
    super.key, 
    required this.answerText, 
    required this.onTap
    });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 60, 4, 66),
              foregroundColor: Colors.white,
            )
          , child: Text(answerText, textAlign: TextAlign.center)
          );
  }
}
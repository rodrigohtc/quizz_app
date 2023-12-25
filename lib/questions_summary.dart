import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(alignment: AlignmentDirectional.center, children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: data['user_answer'] == data['correct_answer']
                                ? const Color.fromARGB(255, 131, 186, 226)
                                : const Color.fromARGB(255, 219, 83, 137),
                          ),
                        ),
                        Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 29, 1, 39),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            //SizedBox(height: 4),
                            Text(
                              data['user_answer'] as String,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 99, 4, 20),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            //SizedBox(height: 4),
                            Text(
                              data['correct_answer'] as String,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 27, 9, 162),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

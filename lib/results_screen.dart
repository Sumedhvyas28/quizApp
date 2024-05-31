import 'package:flutter/material.dart';
import 'package:project/data/questions.dart';
import 'package:project/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswer});

  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++,) {
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': choosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $numCorrectQuestions out $numTotalQuestions answers correctly.'),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            TextButton(
              onPressed: () {},
              child: const Text('restart quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

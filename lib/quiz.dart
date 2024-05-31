import 'package:flutter/material.dart';
import 'package:project/data/questions.dart';
import 'package:project/first_page.dart';
import 'package:project/question_screen.dart';
import 'package:project/results_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScren() {
    setState(
      () {
        activeScreen = 'Question-screen';
      },
    );
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
    Widget screenWidget = FrontPage(switchScren);

    if (activeScreen == 'Question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        choosenAnswer: selectedAnswer,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 56, 162, 215),
                Color.fromARGB(255, 86, 17, 57)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizz_application/data/questions.dart';
import 'package:quizz_application/question_screen.dart';
import 'package:quizz_application/result_screen.dart';
import 'package:quizz_application/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizStat();
  }
}

class _QuizStat extends State<Quiz> {
  List<String> selectedAnswer = [];
  // Widget? activeScreen;   First Way using function

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionScreen();
  //   });
  // }

  //**************************************** */

  /*sencod way using Ternary operator
  to reduce code
   */

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget =
        StartScreen(switchScreen); //Widget screenWidget to switchScreen
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectedAnswer:
            chooseAnswers, /*(4) here we are passing answer to chooseAnswer Function */
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswers: selectedAnswer,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 82, 8, 138),
              Color.fromARGB(255, 82, 8, 138),
            ]),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

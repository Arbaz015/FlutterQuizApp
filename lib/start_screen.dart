import 'package:flutter/material.dart';
import 'package:quizz_application/outlined_button.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 300, color: const Color.fromARGB(150, 255, 255, 255)),
          const SizedBox(
            height: 80,
          ),
          // Opacity(
          //   opacity: 0.1,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const Text(
            'Learn Flutter the fun way',
            style: TextStyle(
                color: Color.fromARGB(255, 226, 213, 233), fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          // OutlinedButton.icon(
          //   onPressed: () {},
          //   label: const Text('Start Quiz'),
          //   style: OutlinedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //   ),
          //   icon: const Icon(Icons.arrow_right_alt),
          // )
          OutlinedButtonStyle(startQuiz),
        ],
      ),
    );
  }
}

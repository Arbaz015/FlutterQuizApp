import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OutlinedButtonStyle extends StatelessWidget {
  const OutlinedButtonStyle(this.startScreen, {super.key});

  final void Function() startScreen;

  @override
  Widget build(context) {
    return OutlinedButton.icon(
      onPressed: startScreen,
      label: const Text('Start Quiz'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color.fromARGB(150, 255, 255, 255),
      ),
      icon: const Icon(Icons.arrow_right_alt),
    );
  }
}

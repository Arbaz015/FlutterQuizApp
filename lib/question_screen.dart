import 'package:flutter/material.dart';
import 'package:quizz_application/utils/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_application/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key,
      required this.onSelectedAnswer}); /*(3) Here we recived function as argument  and send to chooseanser */

  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(
        selectedAnswer); /* (2)Here we forwarded to parent widget 
                                              (Question_screen) by executing
                                              onSelectAnswer*/
    setState(() {
      //to call build method again need setState
      currentQuestionIndex++; //
    });
  }

  @override
  Widget build(context) {
    final cureentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      // alternate of Center
      width: double.infinity, //instead of hardcode value used this
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              cureentQuestion.text,
              style: GoogleFonts.stixTwoText(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...cureentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(
                        answer); /*  (1) This code doesn't execute immediately
                        when this button is created but only when
                        this anonymous function is triggered from inside buttton,
                        when elevated button is tapped in that case only.
                        then after tapped answerQuestion called and answer paass as value to 
                        answerQuestion 
 
                                                    */
                  });
            })
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizz_application/question_summary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            //here map adding new value to data
            return SummaryItem(data);
          }).toList(),
        ),
      ),
//map return so called iterable object hence we need to use toList()
    );
  }
}

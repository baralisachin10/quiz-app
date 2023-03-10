import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  const Quiz(
      {super.key, 
      required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questions(questions[questionIndex]['question'] as String),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}

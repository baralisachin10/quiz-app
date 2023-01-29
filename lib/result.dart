import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  const Result(this.totalScore, this.resetQuiz, {super.key});

  String? get resultPharse {
    String resultText;
    if (totalScore >= 20) {
      resultText = 'You Are awesome and innocent';
    } else if (totalScore >= 14 && totalScore < 20) {
      resultText = 'You are pretty likeable';
    } else if (totalScore >= 8 && totalScore < 14) {
      resultText = 'You are ... strange';
    } else {
      resultText = 'You are bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your score is $totalScore and',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          resultPharse!,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
            onPressed: resetQuiz,
            child: Text('Restart Quiz!'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ))
      ],
    ));
  }
}

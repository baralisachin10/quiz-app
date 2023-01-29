import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'What\'s your favourite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 2},
        {'text': 'Yellow', 'score': 1}
      ]
    },
    {
      'question': 'What\'s your favourite animal',
      'answer': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 1},
        {'text': 'Cow', 'score': 10}
      ]
    },
    {
      'question': 'What\'s your favourite fast food?',
      'answer': [
        {'text': 'Burger', 'score': 10},
        {'text': 'Pizza', 'score': 9},
        {'text': 'MO:MO', 'score': 5},
        {'text': 'Chowmin', 'score': 2}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  // MyAppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

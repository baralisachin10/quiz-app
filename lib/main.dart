import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    // print(_questionIndex);
  }

  // MyAppState({super.key});

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'question': 'What\'s your favourite color?',
        'answer': ['Black', 'Red', 'Green', 'Yellow']
      },
      {
        'question': 'What\'s your favourite animal',
        'answer': ['Rabbit', 'Dog', 'Cow', 'Cat']
      },
      {
        'question': 'What\'s your favourite fast food?',
        'answer': ['Burger', 'pizza', 'MOMO', 'Chowmin']
      },
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(
          children: [
            Questions('${questions[_questionIndex]['question']}'),
            ...(questions[_questionIndex]['answer'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}

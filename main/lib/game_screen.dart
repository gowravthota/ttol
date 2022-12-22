import 'package:flutter/material.dart';

//Question Class
class Question {
  final String question;
  final String choice1;
  final String choice2;
  final String choice3;
  final String answer;

  Question(
      this.question, this.choice1, this.choice2, this.choice3, this.answer);
}

//Some Silly Questions
List<Question> questions = [
  Question(
      'What is the capital of France?', 'Paris', 'London', 'Rome', 'Paris'),
  Question('What is the tallest mountain in the world?', 'Mount Everest', 'K2',
      'Kilimanjaro', 'Mount Everest'),
  Question('Who is the current President of the United States?', 'Joe Biden',
      'Donald Trump', 'Barack Obama', 'Joe Biden')
];

// Quiz Class
class Quiz extends StatefulWidget {
  final List<Question> questions;
  final int questionIndex;
  final Function answerCallback;

  const Quiz({
    super.key,
    required this.questions,
    required this.questionIndex,
    required this.answerCallback,
  });

  @override
  // ignore: library_private_types_in_public_api
  _QuizState createState() => _QuizState();
}

// Quiz State
class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.questions[widget.questionIndex].question),
        ElevatedButton(
          child: Text(widget.questions[widget.questionIndex].choice1),
          onPressed: () {
            widget
                .answerCallback(widget.questions[widget.questionIndex].choice1);
          },
        ),
        ElevatedButton(
          child: Text(widget.questions[widget.questionIndex].choice2),
          onPressed: () {
            widget
                .answerCallback(widget.questions[widget.questionIndex].choice2);
          },
        ),
        ElevatedButton(
          child: Text(widget.questions[widget.questionIndex].choice3),
          onPressed: () {
            widget
                .answerCallback(widget.questions[widget.questionIndex].choice3);
          },
        ),
      ],
    );
  }
}

//Game Class
class Game extends StatefulWidget {
  final List<Question> questions;

  const Game({super.key, required this.questions});

  @override
  // ignore: library_private_types_in_public_api
  _GameState createState() => _GameState();
}

//Game State (Tracks Score, Changes Screens)
class _GameState extends State<Game> {
  int _questionIndex = 0;
  int _score = 0;

  void _answer(String choice) {
    if (choice == widget.questions[_questionIndex].answer) {
      _score++;
    }

    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_questionIndex >= widget.questions.length) {
      return Column(
        children: [
          Text(
              'Game over! You scored $_score out of ${widget.questions.length}'),
          ElevatedButton(
            child: const Text('Play again'),
            onPressed: () {
              setState(() {
                _questionIndex = 0;
                _score = 0;
              });
            },
          ),
        ],
      );
    } else {
      return Quiz(
        questions: widget.questions,
        questionIndex: _questionIndex,
        answerCallback: _answer,
      );
    }
  }
}

//Run Game Class
class RunGame extends StatelessWidget {
  const RunGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Game(
        questions: questions,
      ),
    );
  }
}

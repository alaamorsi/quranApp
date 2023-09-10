import 'package:flutter/material.dart';

class QuestionAnswerScreen extends StatefulWidget {
  @override
  _QuestionAnswerScreenState createState() => _QuestionAnswerScreenState();
}

class _QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  int currentQuestionIndex = 0;
  List<Question> questions = [
    Question(
      "What is the capital of France?",
      ["Paris", "London", "Berlin", "Madrid"],
      0,
    ),
    Question(
      "What is the largest planet in our solar system?",
      ["Mars", "Earth", "Jupiter", "Saturn"],
      2,
    ),
    // Add more questions here
  ];

  int? selectedAnswerIndex;
  bool isCorrect = false;

  void checkAnswer() {
    if (selectedAnswerIndex != null &&
        selectedAnswerIndex == questions[currentQuestionIndex].correctAnswerIndex) {
      setState(() {
        isCorrect = true;
      });
    } else {
      setState(() {
        isCorrect = false;
      });
    }
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        isCorrect = false;
      } else {
        // Display a message or navigate to a result screen when all questions are answered.
        // You can implement this part based on your app's requirements.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question & Answer App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              questions[currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20),
            Column(
              children: questions[currentQuestionIndex]
                  .answerOptions
                  .asMap()
                  .entries
                  .map(
                    (entry) => RadioListTile(
                  title: Text(entry.value),
                  value: entry.key,
                  groupValue: selectedAnswerIndex,
                  onChanged: (value) {
                    setState(() {
                      selectedAnswerIndex = value;
                    });
                  },
                ),
              )
                  .toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                checkAnswer();
                nextQuestion();
              },
              child: Text('Check Answer'),
            ),
            SizedBox(height: 20),
            isCorrect ? Text('Correct!') : Text('Incorrect!'),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> answerOptions;
  final int correctAnswerIndex;

  Question(this.questionText, this.answerOptions, this.correctAnswerIndex);
}

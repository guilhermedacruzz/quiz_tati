import 'package:flutter/material.dart';
import 'package:quiz_tati/question.dart';
import 'repositoryQuestions.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.heart_broken),
          title: const Text(
            "Título do App Quiz",
            style: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
          backgroundColor: const Color(0xff4f5d75),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<Question> questions = QuestionRepository().generate(5);
  var currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color(0xff2d3142),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quiz: ${currentQuestion + 1}",
              ),
              Text("3:00 min"),
            ],
          ),
          const Divider(
            height: 30,
            thickness: 2,
            color: Colors.black26,
          ),
          Text(
            "${currentQuestion + 1}- ${questions[currentQuestion].text}?",
          ),
          ...questions[currentQuestion]
              .allOptions
              .map((option) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentQuestion =
                            min(currentQuestion + 1, questions.length - 1);
                      });
                    },
                    child: Container(
                      color: Colors.amberAccent,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(String.fromCharCode(questions[currentQuestion]
                                  .allOptions
                                  .indexOf(option) +
                              65)),
                          Text(option),
                        ],
                      ),
                    ),
                  )),
          GestureDetector(
            onTap: () {
              setState(() {
                currentQuestion =
                    min(currentQuestion + 1, questions.length - 1);
              });
            },
            child: Center(
              child: Text("next"),
            ),
          ),
        ],
      ),
    );
  }
}

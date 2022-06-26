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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.sentiment_dissatisfied),
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
      padding: const EdgeInsets.only(left: 15, right: 15, top: 60, bottom: 25),
      color: const Color(0xff2d3142),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTextStyle(
            style: const TextStyle(
              color: Color(0xffffffff),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quiz: ${currentQuestion + 1}"),
                Row(
                  children: const [
                    Icon(
                      Icons.timer,
                      color: Color(0xffffffff),
                    ),
                    SizedBox(width: 5),
                    Text("3:00 min"),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            height: 20,
            thickness: 2,
            color: Color(0xffffffff),
          ),
          const SizedBox(height: 35),
          Text(
            "${currentQuestion + 1}. ${questions[currentQuestion].text}?",
            style: const TextStyle(
              color: Color(0xffffffff),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          ...questions[currentQuestion].allOptions.map((option) =>
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentQuestion =
                        min(currentQuestion + 1, questions.length - 1);
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xffff00ff),
                            borderRadius: BorderRadius.circular(100)),
                        child: Text(
                          String.fromCharCode(questions[currentQuestion]
                                  .allOptions
                                  .indexOf(option) +
                              65),
                          style: const TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Text(
                        option,
                        style: const TextStyle(
                          color: Color(0xff4f5d75),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                currentQuestion =
                    min(currentQuestion + 1, questions.length - 1);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xffff00ff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
        children: [
          const Image(
            width: 60,
            height: 60,
            image: AssetImage("assets/images/back.jpg"),
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff4f5d75),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pergunta: ${currentQuestion + 1}/${questions.length}",
                  style: const TextStyle(
                    color: Color(0xffef8354),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    questions[currentQuestion].text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ...questions[currentQuestion]
                    .allOptions
                    .map((option) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentQuestion = min(
                                  currentQuestion + 1, questions.length - 1);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 50,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(
                                color: const Color(0xffbfc0c0),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              option,
                              style: const TextStyle(
                                  fontSize: 17, color: Color(0xffffffff)),
                            ),
                          ),
                        )),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentQuestion =
                          min(currentQuestion + 1, questions.length - 1);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    child: const Icon(
                      Icons.arrow_right_alt,
                      size: 50,
                      color: Color(0xffef8354),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

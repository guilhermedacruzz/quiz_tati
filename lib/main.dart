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
        scaffoldBackgroundColor: const Color(0xff000000),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Nome do Quiz 2"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          elevation: 0.00,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          backgroundColor: const Color(0xff14213d),
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTextStyle(
            style: const TextStyle(
              color: Color(0xffffffff),
              fontSize: 18,
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
          const SizedBox(height: 30),
          Text(
            "${currentQuestion + 1}.  ${questions[currentQuestion].text}?",
            style: const TextStyle(
              color: Color(0xffffffff),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
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
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
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
                          color: const Color(0xfffca311),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 5,
                            ),
                          ],
                        ),
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
                          color: Color(0xff2b2d42),
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
                color: const Color(0xfffca311),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "PRÓXIMA",
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

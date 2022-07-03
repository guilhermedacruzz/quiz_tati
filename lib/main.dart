import 'package:flutter/material.dart';
import 'package:quiz_tati/models/question.dart';
import 'package:quiz_tati/widgets/buttonNext.dart';
import 'package:quiz_tati/widgets/option.dart';
import 'package:quiz_tati/widgets/quizBar.dart';
import 'package:quiz_tati/widgets/textQuestion.dart';
import 'repository/repositoryQuestions.dart';
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

enum StatusQuestion { wainting, answered }

enum StatusQuiz { running, complet, result }

class _BodyState extends State<Body> {
  final List<Question> questions = QuestionRepository().generate(3);
  var currentQuestion = 0;
  StatusQuestion statusQuestion = StatusQuestion.wainting;
  StatusQuiz statusQuiz = StatusQuiz.running;
  String optionSelected = "";

  void selectQuestion(String option) {
    if (statusQuestion == StatusQuestion.wainting) {
      setState(() {
        optionSelected = option;
        statusQuestion = StatusQuestion.answered;
      });
    }
  }

  void nextQuestion() {
    if (statusQuiz == StatusQuiz.complet) {
      setState(() {
        statusQuiz = StatusQuiz.result;
      });
    } else {
      setState(() {
        currentQuestion = min(currentQuestion + 1, questions.length - 1);
        if (currentQuestion == questions.length - 1) {
          statusQuiz = StatusQuiz.complet;
        }
        statusQuestion = StatusQuestion.wainting;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuizBar(
            current: currentQuestion + 1,
            max: questions.length,
          ),
          const Divider(
            height: 20,
            thickness: 2,
            color: Color(0xffffffff),
          ),
          const SizedBox(height: 30),
          TextQuestion(
            text: questions[currentQuestion].text,
            index: currentQuestion + 1,
          ),
          const SizedBox(height: 15),
          ...questions[currentQuestion].allOptions.map((option) => Option(
              option: option,
              isAnswered: statusQuestion == StatusQuestion.answered,
              isSelected: option == optionSelected,
              selectQuestion: selectQuestion,
              index: String.fromCharCode(
                  questions[currentQuestion].allOptions.indexOf(option) + 65))),
          const Spacer(),
          ButtonNext(
            nextQuestion: nextQuestion,
            isComplet: statusQuiz == StatusQuiz.complet,
          ),
        ],
      ),
    );
  }
}

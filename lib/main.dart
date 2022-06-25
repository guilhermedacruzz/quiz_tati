import 'package:flutter/material.dart';
import 'package:quiz_tati/question.dart';
import 'repositoryQuestions.dart';

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
          title: const Text("Título do App Quiz"),
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
      color: Colors.blueAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentQuestion].text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(height: 30, thickness: 2, color: Colors.black26),

            ...questions[currentQuestion]
                .allOptions
                .map((option) => GestureDetector(
                      onTap: () {
                        print("Clicou");
                      },
                      child: Container(
                        child: Text(
                          option,
                          style: TextStyle(fontSize: 18),
                        ),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(
                            color: Colors.white,
                            width: 5,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 5,
                            )
                          ],
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

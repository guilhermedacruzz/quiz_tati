import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_tati/main.dart';

class ResultPage extends StatelessWidget {
  final int hits;
  final int mistakes;
  final Function resetQuiz;

  const ResultPage(
      {Key? key,
      required this.hits,
      required this.mistakes,
      required this.resetQuiz})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/anime.gif",
              height: 250.0,
              width: 250.0,
            ),
            const Text("Parabéns!",
                style: TextStyle(
                  color: Color(0xfffca311),
                  fontSize: 32,
                )),
            DefaultTextStyle(
              style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 24,
              ),
              child: Column(
                children: [
                  const Text("Seu Recorde"),
                  Text("$hits / ${hits + mistakes}")
                ],
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                resetQuiz();
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xfffca311),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Jogar de Novo",
                        style: TextStyle(
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


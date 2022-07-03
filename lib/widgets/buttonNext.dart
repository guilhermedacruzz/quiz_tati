import 'package:flutter/material.dart';
import 'package:quiz_tati/main.dart';

class ButtonNext extends StatelessWidget {
  final Function nextQuestion;
  final bool isComplet;
  
  const ButtonNext({Key? key, required this.nextQuestion, required this.isComplet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: () {
              nextQuestion();
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xfffca311),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  isComplet ? "COMPLETO" : "PRÓXIMA",
                  style: const TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          );
  }
}
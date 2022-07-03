import 'package:flutter/material.dart';

class QuizBar extends StatelessWidget {
  final DateTime now = DateTime.now();
  final int current;
  final int max;
  final int hits;
  final int mistakes;

  QuizBar({Key? key, required this.current, required this.max, required this.hits, required this.mistakes })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Color(0xffffffff),
        fontSize: 18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Pergunta: $current / $max"),
          Row(
            children: [
              const Icon(
                Icons.done,
                color: Color(0xffffffff),
              ),
              const SizedBox(width: 5),
              Text(
                '$hits',
              ),
              const Icon(
                Icons.close,
                color: Color(0xffffffff),
              ),
              const SizedBox(width: 5),
              Text(
                '$mistakes',
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class QuizBar extends StatelessWidget {
  final DateTime now = DateTime.now();
  final int current;
  final int max;

  QuizBar({Key? key, required this.current, required this.max})
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
          Text("Quiz: $current / $max"),
          Row(
            children: [
              const Icon(
                Icons.timer,
                color: Color(0xffffffff),
              ),
              const SizedBox(width: 5),
              Text(
                '${now.hour}:${now.minute}:${now.second}',
              ),
            ],
          )
        ],
      ),
    );
  }
}

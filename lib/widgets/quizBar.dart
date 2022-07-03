import 'package:flutter/material.dart';

class QuizBar extends StatelessWidget {
  final int current;
  final int max;

  const QuizBar({Key? key, required this.current, required this.max }) : super(key: key);

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
    );
  }
}

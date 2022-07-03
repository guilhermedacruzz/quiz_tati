import 'package:flutter/material.dart';

class TextQuestion extends StatelessWidget {
  final String text;
  final int index;

  const TextQuestion({Key? key, required this.text, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$index.  $text?",
      style: const TextStyle(
        color: Color(0xffffffff),
        fontSize: 16,
      ),
    );
  }
}

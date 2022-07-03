import 'dart:ui';

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int hits;
  final int mistakes;
  const ResultPage({Key? key, required this.hits, required this.mistakes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blueAccent,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("skdkd"),
            GestureDetector(
              onTap: () {},
              child: Text("ajhsjs"),
            ),
          ],
        ),
      ),
    );
  }
}

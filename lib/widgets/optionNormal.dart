import 'package:flutter/material.dart';

class OptionNormal extends StatelessWidget {
  final String option;
  final String index;

  const OptionNormal(
      {Key? key,
      required this.option,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
              index,
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
    );
  }
}
import 'package:flutter/material.dart';

class OptionSelected extends StatelessWidget {
  final String option;
  final bool isCorret;

  const OptionSelected({Key? key, required this.option, required this.isCorret }) : super(key: key);

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
          const SizedBox(width: 40),
          Text(
            option,
            style: const TextStyle(
              color: Color(0xff2b2d42),
              fontSize: 14,
            ),
          ),
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
            child: Icon(
              isCorret ? Icons.access_alarm: Icons.dangerous,
            ),
          ),
        ],
      ),
    );
  }
}

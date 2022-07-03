import 'package:flutter/material.dart';

class OptionNormal extends StatelessWidget {
  final String option;
  final String index;

  const OptionNormal({Key? key, required this.option, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class OptionSelected extends StatelessWidget {
  final String option;
  final bool isCorrect;

  const OptionSelected(
      {Key? key, required this.option, required this.isCorrect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          option,
          style: const TextStyle(
            color: Color(0xffffffff),
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
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
            isCorrect ? "V" : "X",
            style: TextStyle(
              color: isCorrect ? const Color(0xff588157): const Color(0xffe63946), 
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class Option extends StatelessWidget {
  final String option;
  final bool isSelected;
  final bool isCorrect;
  final Function selectQuestion;
  final String index;

  const Option(
      {Key? key,
      required this.option,
      required this.isSelected,
      required this.isCorrect,
      required this.selectQuestion,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectQuestion(option);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? isCorrect ? const Color(0xff588157) : const Color(0xffe63946):const Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: isSelected
            ? OptionSelected(option: option, isCorrect: isCorrect)
            : OptionNormal(option: option, index: index),
      ),
    );
  }
}

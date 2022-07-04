import 'package:flutter/material.dart';

class OptionIcon extends StatelessWidget {
  final String index;
  final bool isCorrect;
  final bool isSelected;
  const OptionIcon(
      {Key? key,
      required this.index,
      required this.isCorrect,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffffffff) : const Color(0xfffca311),
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
        isSelected ? isCorrect ? "V" : "X" : index,
        style: TextStyle(
          color: isSelected
              ? isCorrect
                  ? const Color(0xff588157)
                  : const Color(0xffe63946)
              : const Color(0xffffffff),
          fontSize: 20,
        ),
      ),
    );
  }
}

class OptionText extends StatelessWidget {
  final String option;
  final bool isSelected;
  const OptionText({Key? key, required this.option, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      option,
      style: TextStyle(
        color: isSelected ? const Color(0xffffffff) : const Color(0xff2b2d42),
        fontSize: 14,
      ),
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
          color: isSelected
              ? isCorrect
                  ? const Color(0xff588157)
                  : const Color(0xffe63946)
              : const Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            isSelected
                ? OptionText(
                    option: option,
                    isSelected: isSelected,
                  )
                : OptionIcon(
                    index: index,
                    isCorrect: isCorrect,
                    isSelected: isSelected,
                  ),
            isSelected ? const Spacer() : const SizedBox(width: 30),
            isSelected
                ? OptionIcon(
                    index: index,
                    isCorrect: isCorrect,
                    isSelected: isSelected,
                  )
                : OptionText(
                    isSelected: isSelected,
                    option: option,
                  ),
          ],
        ),
      ),
    );
  }
}

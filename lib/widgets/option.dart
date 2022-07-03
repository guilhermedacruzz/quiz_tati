import 'package:flutter/material.dart';
import 'package:quiz_tati/widgets/optionNormal.dart';
import 'package:quiz_tati/widgets/optionSelected.dart';

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
      child: isSelected
          ? OptionSelected(
              option: option,
              isCorret: isCorrect,
            )
          : OptionNormal(
              option: option,
              index: index,
            ),
    );
  }
}

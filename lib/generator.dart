import 'dart:math';
import "string_extension.dart";

class GeneratorQuestions {
  String generatePhase(int space) {
    return List.generate(space, (_) => generateWord()).join(" ").capitalize();
  }

  String generateWord() {
    var random = Random();
    var wordInt = List.generate(random.nextInt(5) + 3, (_) => random.nextInt(25) + 97);
    return String.fromCharCodes(wordInt);
  } 

  Map generate() {
    return {
      "text": generatePhase(5),
      "correct": generatePhase(3),
      "otherOptions": List.generate(3, (_) => generatePhase(3)),
    };
  }
}

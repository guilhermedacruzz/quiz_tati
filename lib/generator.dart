import 'dart:math';

class GeneratorQuestions {
 String generateWord() {
   var random = Random();
   var wordInt = List.generate(random.nextInt(10), (_) => random.nextInt(61) + 65);
   return String.fromCharCodes(wordInt);
 }
 
 Map generateQuestion() {
   return {
     "text": generateWord(),
     "correct": generateWord(),
     "otherOptions": List.generate(3, (_) => generateWord()),
   };
 }
}

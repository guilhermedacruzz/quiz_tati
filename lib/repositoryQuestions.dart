import 'question.dart';
import 'generator.dart';

class QuestionRepository {
 
 List<Question> generateQuestions(int qtde) {
 
   List<Question> questions = [];
 
   for (int i = 0; i < qtde; i++) {
     Map dataQuestion = GeneratorQuestions().generateQuestion();
 
     var question = Question (
       text: dataQuestion["text"],
       correct: dataQuestion["correct"],
       allOptions: [
         ...dataQuestion["outherOptions"],
         dataQuestion["correct"]
       ]..shuffle()
     );
 
     questions.add(question);
   }
 
   return questions;
 }
}

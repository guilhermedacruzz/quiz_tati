import '../models/question.dart';
import '../data/generator.dart';

class QuestionRepository {
  List<Question> generate(int qtde) {
    List<Question> questions = [];

    for (int i = 0; i < qtde; i++) {
      Map dataQuestion = GeneratorQuestions().generate();

      var question = Question(
          text: dataQuestion["text"],
          correct: dataQuestion["correct"],
          allOptions: [
            ...dataQuestion["otherOptions"], 
            dataQuestion["correct"]]
          ..shuffle());

      questions.add(question);
    }

    return questions;
  }
}

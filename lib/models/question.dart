class Question {
  final String text;
  final String correct;
  final List<String> allOptions;

  Question(
      {required this.text, required this.correct, required this.allOptions});

  @override
  String toString() => "Pergunta: $text;Resposta: $correct;Erros: $allOptions";
}

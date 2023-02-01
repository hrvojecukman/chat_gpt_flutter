class QuestionAnswer {
  final String question;
  final StringBuffer answer;

  QuestionAnswer({
    required this.question,
    required this.answer,
  });

  QuestionAnswer copyWith({
    String? newQuestion,
    StringBuffer? newAnswer,
  }) {
    return QuestionAnswer(
      question: newQuestion ?? question,
      answer: newAnswer ?? answer,
    );
  }
}

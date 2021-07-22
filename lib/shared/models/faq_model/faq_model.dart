class FaqModel {
  FaqModel({
    required this.id,
    this.answer,
    this.question,
  });

  String? answer;
  int id;
  String? question;
}

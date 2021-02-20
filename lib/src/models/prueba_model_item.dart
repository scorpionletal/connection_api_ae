class QuestionModel {
  List<Preguntas> preguntas;
  String error;

  QuestionModel({this.preguntas});
  QuestionModel.withError(String errorMessage,{ this.preguntas}) {
    error = errorMessage;
  }

  QuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['preguntas'] != null) {
      preguntas = new List<Preguntas>();
      json['preguntas'].forEach((v) {
        print(v);
        preguntas.add(new Preguntas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.preguntas != null) {
      data['preguntas'] = this.preguntas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Preguntas {
  int iId;
  String answer;
  String category;
  String difficulty;
  String question;
  String imgUrl;

  Preguntas(
      {this.iId,
        this.answer,
        this.category,
        this.difficulty,
        this.question,
        this.imgUrl});

  Preguntas.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    answer = json['answer'];
    category = json['category'];
    difficulty = json['difficulty'];
    question = json['question'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['answer'] = this.answer;
    data['category'] = this.category;
    data['difficulty'] = this.difficulty;
    data['question'] = this.question;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}
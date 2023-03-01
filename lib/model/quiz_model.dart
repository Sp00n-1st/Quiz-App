import 'package:hive/hive.dart';
part 'quiz_model.g.dart';

@HiveType(typeId: 0)
class QuizModel {
  @HiveField(0)
  int? responseCode;
  @HiveField(1)
  List<Results>? results;

  QuizModel({this.responseCode, this.results});

  QuizModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class Results {
  @HiveField(0)
  String? category;
  @HiveField(1)
  String? type;
  @HiveField(2)
  String? difficulty;
  @HiveField(3)
  String? question;
  @HiveField(4)
  String? correctAnswer;
  @HiveField(5)
  List<String>? incorrectAnswers;
  @HiveField(6)
  List<String>? answers;

  Results({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
    this.answers,
  });

  Results.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    incorrectAnswers = json['incorrect_answers']?.cast<String>();

    answers = <String>[];
    if (correctAnswer != null) {
      answers!.add(correctAnswer!);
    }
    if (incorrectAnswers != null) {
      answers!.addAll(incorrectAnswers!);
    }
    answers!.shuffle();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['type'] = type;
    data['difficulty'] = difficulty;
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['incorrect_answers'] = incorrectAnswers;
    return data;
  }
}

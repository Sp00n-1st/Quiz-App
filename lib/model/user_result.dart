import 'package:hive/hive.dart';
part 'user_result.g.dart';

@HiveType(typeId: 2)
class UserResult {
  @HiveField(0)
  int? category;
  @HiveField(1)
  String? difficulty;
  @HiveField(2)
  List<String?> listAnswerUser;
  @HiveField(3)
  List<int?> listAnswerint;
  @HiveField(4)
  List<String?> correctAnswer;
  @HiveField(5)
  int? numberQuestion;
  @HiveField(6)
  bool? isDone;
  UserResult(
      {required this.correctAnswer,
      required this.listAnswerint,
      this.numberQuestion,
      this.category,
      this.difficulty,
      required this.listAnswerUser,
      this.isDone});
}

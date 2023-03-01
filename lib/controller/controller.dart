import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../model/quiz_model.dart';
import '../model/user_result.dart';
import '../view/quiz.dart';
import '../view/result.dart';

class Controller extends GetxController {
  var sizeBar = 15.0.obs;
  var totalQuestion = 0.obs;
  var numberQuiz = 0.obs;
  var numberQuizLocalData = 0.obs;
  var isGetData = false.obs;
  var level = ''.obs;
  var jarak = 0.0.obs;
  var amountQuestion = 0.obs;

  checkLocalData(int category, String difficulty, String name) async {
    difficulty.toLowerCase();
    var open = await Hive.openBox('$category$difficulty');
    var openResult = await Hive.openBox('result$category$difficulty');
    open = Hive.box('$category$difficulty');
    openResult = Hive.box('result$category$difficulty');

    if (open.isEmpty) {
      isGetData.value = true;
      level.value = difficulty;
    } else {
      QuizModel quizModelSingle = open.getAt(0);
      UserResult userResult = openResult.getAt(0);
      if (userResult.isDone == false) {
        Get.to(Quiz(
          difficulty: difficulty,
          category: category,
          name: name,
          quizModel: quizModelSingle,
          userResult: userResult,
        ));
      } else {
        Get.offAll(
            Result(
                correctAnswer: userResult.correctAnswer,
                listAnswerUser: userResult.listAnswerUser,
                totalQuestion: quizModelSingle.results!.length),
            transition: Transition.leftToRightWithFade);
      }
    }
  }

  localData(int category, String difficulty, UserResult userResult,
      int totalQuestion) async {
    var open = await Hive.openBox('result$category$difficulty');
    open = Hive.box('result$category$difficulty');
    await open.putAt(0, userResult);
  }

  loadDataLocal(String difficulty, int category) async {
    late UserResult userResult;
    var openResult = await Hive.openBox('result$category$difficulty');
    openResult = Hive.box('result$category$difficulty');
    userResult = openResult.getAt(0);
    return userResult;
  }

  double scoreCount(List<String?> correctAnswer, List<String?> listAnswerUser,
      int totalQuestion) {
    int correct = 0;
    for (int i = 0; i < totalQuestion; i++) {
      if (correctAnswer[i] == listAnswerUser[i]) {
        correct++;
      }
    }
    var oneScore = 100 / totalQuestion;
    var totalScore = correct * oneScore;
    return totalScore;
  }

  List<String> checkImg(int category) {
    List<String> listImg = [];
    if (category == 21) {
      listImg.add('assets/sport.png');
      listImg.add('assets/softball.png');
      listImg.add('assets/soccer.png');
      listImg.add('assets/medal.png');
      listImg.add('assets/rugby.png');
    } else if (category == 18) {
      listImg.add('assets/computerbg1.png');
      listImg.add('assets/computerbg2.png');
      listImg.add('assets/computerbg3.png');
      listImg.add('assets/computerbg4.png');
      listImg.add('assets/computerbg5.png');
    } else if (category == 31) {
      listImg.add('assets/animebg2.png');
      listImg.add('assets/animebg3.png');
      listImg.add('assets/animebg4.png');
      listImg.add('assets/animebg5.png');
      listImg.add('assets/animebg6.png');
    } else if (category == 15) {
      listImg.add('assets/gamebg1.png');
      listImg.add('assets/gamebg2.png');
      listImg.add('assets/gamebg3.png');
      listImg.add('assets/gamebg4.png');
      listImg.add('assets/gamebg5.png');
    } else if (category == 23) {
      listImg.add('assets/fullmoon.png');
      listImg.add('assets/lamp.png');
      listImg.add('assets/rocket.png');
      listImg.add('assets/basketball.png');
      listImg.add('assets/math.png');
    } else if (category == 22) {
      listImg.add('assets/geographybg1.png');
      listImg.add('assets/geographybg2.png');
      listImg.add('assets/geographybg3.png');
      listImg.add('assets/geographybg4.png');
      listImg.add('assets/geographybg5.png');
    } else if (category == 20) {
      listImg.add('assets/mythologybg1.png');
      listImg.add('assets/mythologybg2.png');
      listImg.add('assets/mythologybg3.png');
      listImg.add('assets/mythologybg4.png');
      listImg.add('assets/mythologybg5.png');
    } else if (category == 19) {
      listImg.add('assets/mathbg1.png');
      listImg.add('assets/mathbg2.png');
      listImg.add('assets/mathbg3.png');
      listImg.add('assets/mathbg4.png');
      listImg.add('assets/mathbg5.png');
    } else if (category == 9) {
      listImg.add('assets/fullmoon.png');
      listImg.add('assets/lamp.png');
      listImg.add('assets/rocket.png');
      listImg.add('assets/basketball.png');
      listImg.add('assets/math.png');
    } else if (category == 12) {
      listImg.add('assets/musicbg1.png');
      listImg.add('assets/musicbg2.png');
      listImg.add('assets/musicbg3.png');
      listImg.add('assets/musicbg4.png');
      listImg.add('assets/musicbg5.png');
    }
    return listImg;
  }

  String filterString(String source) {
    String filter = source
        .replaceAll('&quot;', '"')
        .replaceAll('&amp;', '&')
        .replaceAll('&#039;', '\'')
        .replaceAll('&idquo;', '"')
        .replaceAll('&rdquo;', '"');
    return filter;
  }
}

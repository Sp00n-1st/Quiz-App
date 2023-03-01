import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:oktoast/oktoast.dart';
import '../model/quiz_model.dart';
import '../model/user_result.dart';
import 'controller.dart';
import 'dioex.dart';

class ApiController extends GetxController {
  var controller = Get.put(Controller());
  Dio dio = Dio();
  QuizModel? quizModel;
  List<String?> correctAnswer = [];
  List<int?> listAnswerint = [];
  List<String?> listAnswerUser = [];

  Future<QuizModel> getData(int amount, String difficulty, int category) async {
    difficulty.toLowerCase();
    var open = await Hive.openBox('$category$difficulty');
    open = Hive.box('$category$difficulty');
    var openResult = await Hive.openBox('result$category$difficulty');
    openResult = Hive.box('result$category$difficulty');
    dio.interceptors.add(RetryInterceptor(
        dio: dio,
        logPrint: print,
        retries: 6,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
          Duration(seconds: 4)
        ]));
    try {
      final res = await dio.get(
          'https://opentdb.com/api.php?amount=$amount&category=$category&difficulty=$difficulty&type=multiple');
      if (res.statusCode == 200) {
        quizModel = QuizModel.fromJson(res.data);
        for (int i = 0; i < quizModel!.results!.length; i++) {
          correctAnswer.add(quizModel!.results!.elementAt(i).correctAnswer);
          listAnswerint.add(null);
          listAnswerUser.add(null);
        }
        UserResult userResult = UserResult(
            correctAnswer: correctAnswer,
            listAnswerint: listAnswerint,
            listAnswerUser: listAnswerUser,
            category: category,
            difficulty: difficulty,
            numberQuestion: null,
            isDone: false);
        await open.clear();
        await openResult.clear();
        await openResult.add(userResult);
        await open.add(quizModel);
      } else {
        controller.isGetData.value = false;
        showToast(res.statusCode.toString(),
            backgroundColor: Colors.red,
            position: const ToastPosition(align: Alignment.bottomCenter));
        throw Exception(res.statusCode);
      }
    } on DioError catch (e) {
      controller.isGetData.value = false;
      final errorMsg = DioExceptions.fromDioError(e);
      showToast(errorMsg.message!,
          position: const ToastPosition(align: Alignment.bottomCenter));
    }
    return quizModel!;
  }
}

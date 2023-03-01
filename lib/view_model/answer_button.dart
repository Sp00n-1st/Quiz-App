import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/controller.dart';
import '../model/user_result.dart';

// ignore: must_be_immutable
class AnswerButton extends StatelessWidget {
  List<String> answer;
  int numQuestion, totalQuestion;
  UserResult? userResult;
  String difficulty;
  int category;

  AnswerButton(
      {super.key,
      required this.answer,
      required this.numQuestion,
      required this.totalQuestion,
      required this.userResult,
      required this.category,
      required this.difficulty});

  @override
  Widget build(BuildContext context) {
    int? checkAnswer;
    var controller = Get.put(Controller());

    for (int i = 0; i < answer.length; i++) {
      if (answer[i] == userResult!.listAnswerUser[numQuestion]) {
        if (userResult == null) {
          checkAnswer = null;
        } else {
          checkAnswer = i;
        }
      }
    }

    Rxn<int> answerChoose = Rxn<int>(checkAnswer);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 350,
          height: 50,
          child: Obx(
            () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: answerChoose.value == 0
                        ? const Color(0xffB5F1CC)
                        : Colors.white,
                    shape: const StadiumBorder()),
                onPressed: () {
                  answerChoose.value = 0;
                  userResult!.listAnswerint[numQuestion] = 1;
                  userResult!.listAnswerUser[numQuestion] = answer.elementAt(0);
                  controller.localData(
                      category, difficulty, userResult!, totalQuestion);
                },
                child: Text(
                  controller.filterString(answer.elementAt(0)),
                  style: GoogleFonts.poppins(color: Colors.black),
                )),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 350,
          height: 50,
          child: Obx(
            () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: answerChoose.value == 1
                        ? const Color(0xffB5F1CC)
                        : Colors.white,
                    shape: const StadiumBorder()),
                onPressed: () {
                  answerChoose.value = 1;
                  userResult!.listAnswerint[numQuestion] = 2;
                  userResult!.listAnswerUser[numQuestion] = answer.elementAt(1);
                  controller.localData(
                      category, difficulty, userResult!, totalQuestion);
                },
                child: Text(
                  controller.filterString(answer.elementAt(1)),
                  style: GoogleFonts.poppins(color: Colors.black),
                )),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 350,
          height: 50,
          child: Obx(
            () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: answerChoose.value == 2
                        ? const Color(0xffB5F1CC)
                        : Colors.white,
                    shape: const StadiumBorder()),
                onPressed: () {
                  answerChoose.value = 2;
                  userResult!.listAnswerint[numQuestion] = 3;
                  userResult!.listAnswerUser[numQuestion] = answer.elementAt(2);
                  controller.localData(
                      category, difficulty, userResult!, totalQuestion);
                },
                child: Text(
                  controller.filterString(answer.elementAt(2)),
                  style: GoogleFonts.poppins(color: Colors.black),
                )),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 350,
          height: 50,
          child: Obx(
            () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: answerChoose.value == 3
                        ? const Color(0xffB5F1CC)
                        : Colors.white,
                    shape: const StadiumBorder()),
                onPressed: () {
                  answerChoose.value = 3;
                  userResult!.listAnswerint[numQuestion] = 4;
                  userResult!.listAnswerUser[numQuestion] = answer.elementAt(3);
                  controller.localData(
                      category, difficulty, userResult!, totalQuestion);
                },
                child: Text(
                  controller.filterString(answer.elementAt(3)),
                  style: GoogleFonts.poppins(color: Colors.black),
                )),
          ),
        )
      ],
    );
  }
}

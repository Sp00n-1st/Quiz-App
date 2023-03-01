import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/controller.dart';
import '../model/quiz_model.dart';
import '../model/user_result.dart';
import '../view_model/answer_button.dart';
import '../view_model/background_main.dart';
import '../view_model/bar.dart';
import 'home.dart';
import 'result.dart';

// ignore: must_be_immutable
class Quiz extends StatelessWidget {
  String difficulty, name;
  int category;
  QuizModel quizModel;
  UserResult? userResult;

  Quiz(
      {super.key,
      required this.difficulty,
      required this.quizModel,
      required this.category,
      required this.name,
      this.userResult});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Controller());
    var totalBar = controller.totalQuestion.value = quizModel.results!.length;
    var sizeOneBar = 300 / totalBar;
    var index = 0.obs;
    controller.sizeBar.value = sizeOneBar;
    controller.numberQuiz.value = 1;
    controller.totalQuestion.value = quizModel.results!.length;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (controller.numberQuiz.value == 1 || index.value == 0)
                ? const SizedBox()
                : IconButton(
                    onPressed: () async {
                      controller.sizeBar.value -= sizeOneBar;
                      controller.numberQuiz.value -= 1;
                      index.value -= 1;
                      controller.localData(category, difficulty, userResult!,
                          quizModel.results!.length);
                    },
                    icon: const Icon(
                      CupertinoIcons.chevron_left,
                      color: Colors.white,
                    )),
            (controller.numberQuiz.value == quizModel.results!.length)
                ? ActionChip(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    backgroundColor: Colors.green,
                    onPressed: () {
                      if (userResult!.listAnswerint.contains(null)) {
                        Get.dialog(CupertinoAlertDialog(
                          content: Text(
                            'Fill In All Quiz Questions Before You Submit',
                            style: GoogleFonts.poppins(fontSize: 25),
                          ),
                          actions: [
                            MaterialButton(
                              child: Text(
                                'OK',
                                style: GoogleFonts.poppins(),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ));
                      } else {
                        Get.dialog(CupertinoAlertDialog(
                          content: Text(
                            'Are Sure To Submit ?',
                            style: GoogleFonts.poppins(fontSize: 25),
                          ),
                          actions: [
                            MaterialButton(
                              child: Text(
                                'Yes',
                                style: GoogleFonts.poppins(),
                              ),
                              onPressed: () async {
                                userResult!.isDone = true;
                                controller.localData(category, difficulty,
                                    userResult!, quizModel.results!.length);
                                Navigator.pop(context);
                                Get.offAll(
                                    Result(
                                        correctAnswer:
                                            userResult!.correctAnswer,
                                        listAnswerUser:
                                            userResult!.listAnswerUser,
                                        totalQuestion:
                                            quizModel.results!.length),
                                    transition: Transition.leftToRightWithFade);
                              },
                            ),
                            MaterialButton(
                              child: Text(
                                'No',
                                style: GoogleFonts.poppins(),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ));
                      }
                    },
                    label: Text(
                      'Submit',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ))
                : IconButton(
                    onPressed: () {
                      controller.sizeBar.value += sizeOneBar;
                      controller.numberQuiz.value += 1;
                      index.value += 1;
                      controller.localData(category, difficulty, userResult!,
                          quizModel.results!.length);
                    },
                    icon: const Icon(
                      CupertinoIcons.chevron_right,
                      color: Colors.white,
                    )),
          ],
        ),
      ),
      backgroundColor: const Color(0xff566af4),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          name,
          style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff566af4),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_left),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text(
                    'Are Sure To Out From Quiz ?',
                    style: GoogleFonts.poppins(),
                  ),
                  content: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 75,
                      width: 75,
                      child: Image.asset('assets/out.png')),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          child: Text(
                            'Yes',
                            style: GoogleFonts.poppins(),
                          ),
                          onPressed: () {
                            Get.offAll(const Home(),
                                transition: Transition.rightToLeftWithFade);
                          },
                        ),
                        MaterialButton(
                          child: Text(
                            'No',
                            style: GoogleFonts.poppins(),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
      body: Stack(
        children: [
          BackgroundMain(img: controller.checkImg(category)),
          Column(
            children: [
              Center(
                child: Text(
                  'Level $difficulty',
                  style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(
                () => Bar(
                  currentQuestion: index.value + 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Obx(() {
                  return Text(
                    controller.filterString(
                        quizModel.results!.elementAt(index.value).question!),
                    textAlign: TextAlign.justify,
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                  );
                }),
              ),
              const SizedBox(
                height: 50,
              ),
              Obx(() => AnswerButton(
                    category: category,
                    difficulty: difficulty,
                    userResult: userResult,
                    answer: quizModel.results!.elementAt(index.value).answers!,
                    numQuestion: index.value,
                    totalQuestion: quizModel.results!.length,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

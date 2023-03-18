import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/controller.dart';
import '../model/quiz_model.dart';
import '../view_model/check_answer.dart';
import 'home.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  List<String?> correctAnswer;
  List<String?> listAnswerUser;
  int totalQuestion;
  String difficulty, name;
  int category;
  QuizModel quizModel;
  Result(
      {super.key,
      required this.correctAnswer,
      required this.listAnswerUser,
      required this.totalQuestion,
      required this.name,
      required this.category,
      required this.difficulty,
      required this.quizModel});
  @override
  Widget build(BuildContext context) {
    String? image;
    var controller = Get.put(Controller());
    var controllerCenter =
        ConfettiController(duration: const Duration(minutes: 10)).obs;

    Path drawStar(Size size) {
      // Method to convert degree to radians
      double degToRad(double deg) => deg * (pi / 180.0);
      const numberOfPoints = 5;
      final halfWidth = size.width / 2;
      final externalRadius = halfWidth;
      final internalRadius = halfWidth / 2.5;
      final degreesPerStep = degToRad(360 / numberOfPoints);
      final halfDegreesPerStep = degreesPerStep / 2;
      final path = Path();
      final fullAngle = degToRad(360);
      path.moveTo(size.width, halfWidth);
      for (double step = 0; step < fullAngle; step += degreesPerStep) {
        path.lineTo(halfWidth + externalRadius * cos(step),
            halfWidth + externalRadius * sin(step));
        path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
            halfWidth + internalRadius * sin(step + halfDegreesPerStep));
      }
      path.close();
      return path;
    }

    var count =
        controller.scoreCount(correctAnswer, listAnswerUser, totalQuestion);
    controllerCenter.value.play();
    if (count >= 85) {
      image = 'assets/gold2.png';
    } else if (count >= 75) {
      image = 'assets/silver.png';
    } else if (count >= 65) {
      image = 'assets/bronze.png';
    } else if (count < 65) {
      image = 'assets/sad.png';
    }

    return Scaffold(
        backgroundColor: const Color(0xff566af4),
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text(
                            'Are You Sure To Replay Quiz ?',
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                          content: const Icon(
                            Icons.replay,
                            size: 50,
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () async {
                                await controller.replayQuiz(
                                    category, difficulty, quizModel, name);
                              },
                              child: Text(
                                'Yes',
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'No',
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.replay)),
              const SizedBox(
                width: 20,
              )
            ],
            centerTitle: true,
            title: Text(
              'Result',
              style: GoogleFonts.poppins(),
            ),
            elevation: 0,
            backgroundColor: const Color(0xff566af4),
            leading: IconButton(
                onPressed: () {
                  Get.offAll(const Home(),
                      transition: Transition.rightToLeftWithFade);
                },
                icon: const Icon(CupertinoIcons.chevron_left))),
        body: Container(
          margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: SizedBox(
                        width: 250, height: 250, child: Image.asset(image!)),
                  ),
                  count >= 65
                      ? Center(
                          child: Obx(
                            () => ConfettiWidget(
                              confettiController: controllerCenter.value,
                              blastDirectionality: BlastDirectionality
                                  .explosive, // don't specify a direction, blast randomly
                              shouldLoop:
                                  true, // start again as soon as the animation is finished
                              colors: const [
                                Colors.green,
                                Colors.blue,
                                Colors.pink,
                                Colors.orange,
                                Colors.purple,
                                Colors.white,
                                Color(0xffF2921D)
                              ], // manually specify the colors to be used
                              createParticlePath:
                                  drawStar, // define a custom shape/path.
                            ),
                          ),
                        )
                      : const Center()
                ],
              ),
              Text(
                'Your Score',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 30),
              ),
              Text(
                count.toStringAsFixed(1),
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: totalQuestion,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70,
                      mainAxisExtent: 40,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return CheckAnswer(
                      correctAnswer: correctAnswer[index],
                      listAnswerUser: listAnswerUser[index],
                      number: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/api_controller.dart';
import '../controller/controller.dart';
import '../model/quiz_model.dart';
import '../model/user_result.dart';
import '../view_model/background_main.dart';
import '../view_model/difficulty.dart';
import 'quiz.dart';

// ignore: must_be_immutable
class PickLevel extends StatelessWidget {
  int category;
  String name;
  PickLevel({super.key, required this.category, required this.name});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Controller());
    var apiController = Get.put(ApiController());
    var img = controller.checkImg(category);

    return Scaffold(
        backgroundColor: const Color(0xff566af4),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Select Level',
            style: GoogleFonts.poppins(fontSize: 30, color: Colors.white),
          ),
          backgroundColor: const Color(0xff566af4),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(CupertinoIcons.chevron_left),
          ),
        ),
        body: Stack(
          children: [
            BackgroundMain(img: img),
            Obx(() => (controller.isGetData.isFalse)
                ? Difficulty(category: category, name: name)
                : FutureBuilder<QuizModel>(
                    future: apiController.getData(
                        controller.amountQuestion.value,
                        controller.level.value.toLowerCase(),
                        category),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.white),
                        );
                      } else {
                        if (snapshot.hasData) {
                          Future.delayed(
                            const Duration(microseconds: 10),
                            () async {
                              UserResult userResult =
                                  await controller.loadDataLocal(
                                      controller.level.value.toLowerCase(),
                                      category);
                              Get.to(Quiz(
                                  userResult: userResult,
                                  quizModel: snapshot.data!,
                                  difficulty: controller.level.value,
                                  category: category,
                                  name: name));
                              controller.isGetData.value = false;
                            },
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.white),
                        );
                      }
                    },
                  )),
          ],
        ));
  }
}

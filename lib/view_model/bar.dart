import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/controller.dart';

// ignore: must_be_immutable
class Bar extends StatelessWidget {
  int currentQuestion;
  Bar({super.key, required this.currentQuestion});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Controller());

    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff4b5fe1),
                  borderRadius: BorderRadius.circular(25)),
              height: 5,
              width: 300,
            ),
            Obx(
              () => AnimatedContainer(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                duration: const Duration(seconds: 1),
                height: 5,
                width: controller.sizeBar.value,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Obx(
          () => Text(
            '$currentQuestion/${controller.totalQuestion}',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        )
      ],
    );
  }
}

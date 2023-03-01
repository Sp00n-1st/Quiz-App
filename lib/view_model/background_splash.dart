import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

class BackgroundSplash extends StatelessWidget {
  const BackgroundSplash({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Controller());
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: sizeWidth,
      height: sizeHeight,
      child: Stack(
        children: [
          Positioned(
            left: sizeWidth / 1.5,
            top: 100,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(25 / 360),
              child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset('assets/splash2.png')),
            ),
          ),
          Positioned(
            top: sizeHeight / 3,
            left: sizeWidth * 0.05,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-15 / 360),
                child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset('assets/splash1.png'))),
          ),
          Positioned(
            top: sizeHeight / 1.2,
            left: sizeWidth / 7,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-10 / 360),
                child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset('assets/splash3.png'))),
          ),
          Positioned(
            top: 100,
            left: sizeWidth / 2.9,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-10 / 360),
                child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset('assets/basketball.png'))),
          ),
          Positioned(
            top: 500,
            left: sizeWidth * 0.2,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(-60 / 360),
              child: Obx(
                () => AnimatedContainer(
                  padding: EdgeInsets.only(left: controller.jarak.value),
                  alignment: Alignment.centerLeft,
                  duration: const Duration(seconds: 5),
                  width: 600,
                  height: 60,
                  child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(45 / 360),
                      child: Image.asset('assets/splash4.png')),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

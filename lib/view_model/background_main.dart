import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackgroundMain extends StatelessWidget {
  List<String> img;
  BackgroundMain({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: sizeWidth,
      height: sizeHeight,
      child: Stack(
        children: [
          Positioned(
            left: sizeWidth / 1.3,
            child: SizedBox(height: 70, width: 70, child: Image.asset(img[0])),
          ),
          Positioned(
            top: sizeHeight / 3,
            left: sizeWidth * 0.05,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-15 / 360),
                child: SizedBox(
                    height: 70, width: 70, child: Image.asset(img[1]))),
          ),
          Positioned(
            top: sizeHeight / 2,
            left: sizeWidth / 2.5,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-10 / 360),
                child: SizedBox(
                    height: 70, width: 70, child: Image.asset(img[2]))),
          ),
          Positioned(
            top: sizeHeight * 0.65,
            left: sizeWidth / 1.6,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(2 / 360),
                child: SizedBox(
                    height: 70, width: 70, child: Image.asset(img[3]))),
          ),
          Positioned(
            top: sizeHeight / 1.5,
            left: sizeWidth / 5,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(10 / 360),
                child: SizedBox(
                    height: 70, width: 70, child: Image.asset(img[4]))),
          ),
        ],
      ),
    );
  }
}

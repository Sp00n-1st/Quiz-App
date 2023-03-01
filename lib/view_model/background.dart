import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

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
            left: sizeWidth / 1.09,
            child: SizedBox(
                height: 70,
                width: 70,
                child: Image.asset('assets/fullmoon.png')),
          ),
          Positioned(
            top: sizeHeight / 3,
            left: sizeWidth * 0.05,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-15 / 360),
                child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset('assets/lamp.png'))),
          ),
          Positioned(
            top: sizeHeight / 2,
            left: sizeWidth / 2.5,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-10 / 360),
                child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset('assets/rocket.png'))),
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
            top: sizeHeight / 1.7,
            left: sizeWidth / 5,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-10 / 360),
                child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset('assets/math.png'))),
          ),
        ],
      ),
    );
  }
}

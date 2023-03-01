import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'view_model/background_splash.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff566af4),
      body: Stack(
        children: [
          const BackgroundSplash(),
          SizedBox(
            width: sizeWidth,
            height: sizeHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 250,
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Quiz Time',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 35),
                ),
                const SizedBox(
                  height: 50,
                ),
                LoadingAnimationWidget.dotsTriangle(
                    color: Colors.white, size: 50)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

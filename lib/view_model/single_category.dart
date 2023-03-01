import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../view/pick_level.dart';

// ignore: must_be_immutable
class SingleCategory extends StatelessWidget {
  String img, name;
  int category;
  SingleCategory(
      {super.key,
      required this.category,
      required this.img,
      required this.name});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: MaterialButton(
            onPressed: () {
              Get.to(PickLevel(category: category, name: name),
                  transition: Transition.leftToRightWithFade);
            },
            child: Center(
                child: Image.asset(
              'assets/$img.png',
              fit: BoxFit.fill,
            )),
          ),
        ),
        SizedBox(
          width: 150,
          child: Text(
            name,
            maxLines: 2,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CheckAnswer extends StatelessWidget {
  String? correctAnswer;
  String? listAnswerUser;
  int number;
  CheckAnswer(
      {super.key,
      required this.correctAnswer,
      required this.listAnswerUser,
      required this.number});
  @override
  Widget build(BuildContext context) {
    number += 1;
    var isCorrect = (correctAnswer == listAnswerUser) ? true : false;
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              number.toString(),
              style: GoogleFonts.poppins(fontSize: 24, color: Colors.black),
            ),
            Icon(
              isCorrect ? CupertinoIcons.check_mark : CupertinoIcons.xmark,
              color: isCorrect ? Colors.green : Colors.red,
            )
          ],
        ));
  }
}

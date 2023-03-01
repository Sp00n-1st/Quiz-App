import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/controller.dart';

// ignore: must_be_immutable
class Difficulty extends StatelessWidget {
  String name;
  int category;
  Difficulty({
    super.key,
    required this.category,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    int amountQuestion;
    if (category == 20) {
      amountQuestion = 10;
    } else if (category == 19) {
      amountQuestion = 5;
    } else {
      amountQuestion = 15;
    }
    var controller = Get.put(Controller());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 150,
        ),
        ActionChip(
          backgroundColor: Colors.green,
          labelPadding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
          label: Text(
            'Easy',
            style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
          ),
          onPressed: () async {
            controller.amountQuestion.value = amountQuestion;
            controller.checkLocalData(
              category,
              'Easy',
              name,
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ActionChip(
          backgroundColor: Colors.orange,
          labelPadding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
          label: Text(
            'Medium',
            style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
          ),
          onPressed: () {
            controller.amountQuestion.value = amountQuestion;
            controller.checkLocalData(category, 'Medium', name);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ActionChip(
          backgroundColor: Colors.red,
          labelPadding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
          label: Text(
            'Hard',
            style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
          ),
          onPressed: () {
            controller.amountQuestion.value = amountQuestion;
            controller.checkLocalData(category, 'Hard', name);
          },
        )
      ],
    );
  }
}

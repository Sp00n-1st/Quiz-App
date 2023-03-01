import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff566af4),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Let\'s Play',
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.w600),
          ),
          Text(
            'Choose a category to start playing',
            style: GoogleFonts.poppins(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

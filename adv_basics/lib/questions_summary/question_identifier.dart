import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.questionIndex,
    required this.isCorrect,
  });

  final int questionIndex;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex;

    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCorrect
            ? const Color.fromRGBO(76, 175, 80, 1)
            : const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Text(
        (questionNumber + 1).toString(),
        style: GoogleFonts.lato(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

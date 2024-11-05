import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextBodyBold extends StatelessWidget {
  const CustomTextBodyBold(
      {super.key, required this.title, this.positionText = true});

  final String title;
  final bool positionText;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: false,
      textAlign: positionText ? TextAlign.start : TextAlign.end,
    );
  }
}

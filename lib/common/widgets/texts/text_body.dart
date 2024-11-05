
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextBody extends StatelessWidget {
  const CustomTextBody({
    super.key,
    required this.title,  this.positionText = true,
  });

  final String title;
  final bool positionText;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.openSans(
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: false,
      textAlign: positionText ? TextAlign.start : TextAlign.end,
    );
  }
}
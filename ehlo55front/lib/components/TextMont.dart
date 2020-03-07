import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HexColor.dart';

class TextMont extends StatefulWidget {
  String text;
  double textSize;
  Color color;
  FontWeight fontWeight;
  TextAlign textAlign;
  TextMont(
      {this.text,
      this.textSize,
      this.color = Colors.black,
      this.fontWeight,
      this.textAlign});
  @override
  _TextMontState createState() => _TextMontState();
}

class _TextMontState extends State<TextMont> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.montserrat(
        fontSize: widget.textSize,
        color: widget.color,
        fontWeight: widget.fontWeight,
      ),
      textAlign: widget.textAlign,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Modified_text extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const Modified_text({Key key, this.text, this.color, this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
          color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

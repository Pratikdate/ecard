import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';


class FontHandler extends StatelessWidget{


  const FontHandler(this.text,{
    required this.color,
    required this.textAlign,
    this.fontsize,
    this.fontweight,
    super.key,
  });
  final TextAlign textAlign;
  final String text;
  final double? fontsize;
  final FontWeight? fontweight;
  final Color color;


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;


    return Text(
      text,
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.fade,
      textAlign: textAlign,
      style: GoogleFonts.roboto(
        fontSize: fontsize ,//provide in %
        fontWeight: fontweight,
        color: color,
      ),
    );
  }

}
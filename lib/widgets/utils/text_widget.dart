import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meuDas/utils/app_colors.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final TextStyle style;
  final MaterialColor color;

  TextWidget.description({
    super.key,
    required this.text,
    this.color = AppColors.black,
  }) : style = GoogleFonts.ubuntu(
          fontSize: 17,
          fontWeight: FontWeight.normal,
          color: color,
        );

  TextWidget.title({
    super.key,
    required this.text,
    this.color = AppColors.purple,
  }) : style = GoogleFonts.ubuntu(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: color,
        );

  TextWidget.title2({
    super.key,
    required this.text,
    this.color = AppColors.purple,
  }) : style = GoogleFonts.ubuntu(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color,
        );

  TextWidget.title3({
    super.key,
    required this.text,
    this.color = AppColors.purple,
  }) : style = GoogleFonts.ubuntu(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: color,
        );

  TextWidget.link({
    super.key,
    required this.text,
    this.color = AppColors.purple,
  }) : style = GoogleFonts.ubuntu(
          fontWeight: FontWeight.w600,
          color: color,
        );

  TextWidget.logoBig({
    super.key,
    required this.text,
    this.color = AppColors.purple,
  }) : style = GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          fontSize: 50,
          color: color,
        );

  TextWidget.logoSmall({
    super.key,
    required this.text,
    this.color = AppColors.purple,
  }) : style = GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          fontSize: 40,
          color: color,
        );

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: widget.style,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final TextStyle style;

  TextWidget.description({
    super.key,
    required this.text,
  }) : style = GoogleFonts.ubuntu(
          fontSize: 17,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        );

  TextWidget.title({
    super.key,
    required this.text,
  }) : style = GoogleFonts.ubuntu(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColors.purple,
        );

  TextWidget.title2({
    super.key,
    required this.text,
  }) : style = GoogleFonts.ubuntu(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.purple,
        );

  TextWidget.link({
    super.key,
    required this.text,
  }) : style = GoogleFonts.ubuntu(
          fontWeight: FontWeight.w600,
          color: AppColors.purple,
        );

  TextWidget.logoBig({
    super.key,
    required this.text,
  }) : style = GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          fontSize: 50,
          color: AppColors.purple,
        );

  TextWidget.logoSmall({
    super.key,
    required this.text,
  }) : style = GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          fontSize: 40,
          color: AppColors.purple,
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

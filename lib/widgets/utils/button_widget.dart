import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatefulWidget {
  void Function()? onPressed;
  String buttonText;

  ButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: AppColors.purple,
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.buttonText,
          style: GoogleFonts.ubuntu(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

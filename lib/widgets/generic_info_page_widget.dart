import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/widgets/input_widget.dart';

class GenericInfoPageWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final TextEditingController? controller;
  final String? hintText;
  final String buttonText;
  final void Function()? onPressed;

  const GenericInfoPageWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.controller,
    this.hintText,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  State<GenericInfoPageWidget> createState() => _GenericInfoPageWidgetState();
}

class _GenericInfoPageWidgetState extends State<GenericInfoPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 80,
                  color: AppColors.purple,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                Text(
                  widget.title,
                  style: GoogleFonts.ubuntu(
                    fontSize: 25,
                    color: AppColors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 25)),
                Text(
                  widget.description,
                  style: GoogleFonts.ubuntu(
                    fontSize: 17,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 50)),
                if (widget.controller != null && widget.hintText != null) ...[
                  InputWidget(
                    controller: widget.controller!,
                    hintText: widget.hintText!,
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 50)),
                ],
                FractionallySizedBox(
                  widthFactor: 1,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

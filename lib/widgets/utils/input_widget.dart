import 'package:flutter/material.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscure;
  final bool autoFocus;
  final TextEditingController? controller;
  final String title;
  final bool readOnly;
  final double padding;
  const InputWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.autoFocus = false,
    this.title = " ",
    this.readOnly = false,
    this.padding = 5.0,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.title != " "
            ? Align(
                alignment: Alignment.centerLeft,
                child: TextWidget.title2(
                  text: widget.title,
                ),
              )
            : const SizedBox.shrink(),
        TextField(
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            filled: widget.readOnly,
            hintText: widget.hintText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscure,
          autofocus: widget.autoFocus,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: widget.padding),
        ),
      ],
    );
  }
}

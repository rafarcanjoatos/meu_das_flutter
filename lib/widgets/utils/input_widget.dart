import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscure;
  final bool autoFocus;
  final TextEditingController controller;
  const InputWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.obscure = false,
      this.autoFocus = false});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: const OutlineInputBorder(borderRadius: BorderRadius.zero)),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscure,
      autofocus: widget.autoFocus,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:meuDas/utils/app_colors.dart';
import 'package:meuDas/utils/app_strings.dart';
import 'package:meuDas/utils/validate_utils.dart';
import 'package:meuDas/widgets/utils/button_widget.dart';
import 'package:meuDas/widgets/utils/input_widget.dart';
import 'package:meuDas/widgets/utils/text_widget.dart';

class GenericInfoPageWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final MaskedTextController? controller;
  final String? hintText;
  final String buttonText;
  final bool validation;
  final void Function()? onPressed;

  const GenericInfoPageWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.controller,
    this.hintText,
    required this.buttonText,
    this.validation = false,
    required this.onPressed,
  });

  @override
  State<GenericInfoPageWidget> createState() => _GenericInfoPageWidgetState();
}

class _GenericInfoPageWidgetState extends State<GenericInfoPageWidget> {
  final _formKey = GlobalKey<FormState>();

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
                TextWidget.title(
                  text: widget.title,
                ),
                const Padding(padding: EdgeInsets.only(top: 25)),
                TextWidget.description(
                  text: widget.description,
                ),
                const Padding(padding: EdgeInsets.only(top: 50)),
                if (widget.controller != null && widget.hintText != null) ...[
                  Form(
                    key: _formKey,
                    child: InputWidget(
                      controller: widget.controller!,
                      hintText: widget.hintText!,
                      autoFocus: true,
                      keyboardType: TextInputType.number,
                      maxLenght: 15,
                      validation: (value) => _buildValidation(value),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 50)),
                ],
                ButtonWidget(
                  buttonText: widget.buttonText,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      widget.onPressed!();
                    } else if (widget.validation == true) {
                      widget.onPressed!();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _buildValidation(String value) {
    if (!ValidateUtils.isCPF(value)) {
      return AppStrings.cpfInvalid;
    }

    if (!ValidateUtils.minLenght(value, 14)) {
      return AppStrings.cpfInvalid;
    }

    return null;
  }
}

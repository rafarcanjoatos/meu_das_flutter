import 'package:flutter/material.dart';
import 'package:meuDas/utils/app_strings.dart';
import 'package:meuDas/utils/navigator_utils.dart';
import 'package:meuDas/widgets/utils/text_widget.dart';

class DialogModal extends StatefulWidget {
  final String title;
  final String description;
  final Widget page;
  const DialogModal({
    super.key,
    required this.title,
    required this.description,
    required this.page,
  });

  @override
  State<DialogModal> createState() => _DialogModalState();
}

class _DialogModalState extends State<DialogModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextWidget.title2(text: widget.title),
      content: TextWidget.description(text: widget.description),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: TextWidget.description(text: AppStrings.buttonCancel),
        ),
        TextButton(
          onPressed: () {
            NavigatorUtils.navigatorScreen(
              context,
              widget.page,
            );
          },
          child: TextWidget.description(text: AppStrings.buttonSave),
        ),
      ],
    );
  }
}

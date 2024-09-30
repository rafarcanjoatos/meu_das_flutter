import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/app/user_info_page.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class DialogModal extends StatefulWidget {
  final String title;
  final String description;
  const DialogModal({
    super.key,
    required this.title,
    required this.description,
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
              const UserInfoPage(),
            );
          },
          child: TextWidget.description(text: AppStrings.buttonSave),
        ),
      ],
    );
  }
}

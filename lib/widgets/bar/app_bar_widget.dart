import 'package:flutter/material.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget  {
  @override
  final Size preferredSize;
  
  const AppBarWidget({super.key})
      : preferredSize = const Size.fromHeight(56.0);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsetsDirectional.only(start: 40),
        child: TextWidget.logoSmall(
          text: AppStrings.appName,
        ),
      ),
    );
  }
}

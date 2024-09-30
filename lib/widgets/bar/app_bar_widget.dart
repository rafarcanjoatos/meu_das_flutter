import 'package:flutter/material.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AppBarWidget({super.key}) : preferredSize = const Size.fromHeight(65.0);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.black.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: AppBar(
        centerTitle: true,
        title: TextWidget.logoSmall(
          text: AppStrings.appName,
        ),
      ),
    );
  }
}

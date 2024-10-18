import 'package:flutter/material.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget? page;
  final bool hasLeading;

  const AppBarWidget({
    super.key,
    this.page,
    this.hasLeading = true,
  }) : preferredSize = const Size.fromHeight(65.0);

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
        automaticallyImplyLeading: hasLeading,
        leading: page != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => NavigatorUtils.navigatorScreen(
                  context,
                  page!,
                ),
              )
            : null,
        centerTitle: true,
        title: TextWidget.logoSmall(
          text: AppStrings.appName,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class ItemMenuWidget extends StatefulWidget {
  final String title;
  final IconData icon;
  final Widget page;
  const ItemMenuWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.page,
  });

  @override
  State<ItemMenuWidget> createState() => _ItemMenuWidgetState();
}

class _ItemMenuWidgetState extends State<ItemMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorUtils.navigatorScreen(
          context,
          widget.page,
        );
      },
      child: Container(
        height: 170,
        decoration: ShapeDecoration(
          color: AppColors.purple.withOpacity(0.2),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: AppColors.purple,
              size: 50,
            ),
            TextWidget.link(text: widget.title),
          ],
        ),
      ),
    );
  }
}

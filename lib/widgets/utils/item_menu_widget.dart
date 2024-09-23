import 'package:flutter/material.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class ItemMenuWidget extends StatefulWidget {
  final String title;
  const ItemMenuWidget({
    super.key,
    required this.title,
  });

  @override
  State<ItemMenuWidget> createState() => _ItemMenuWidgetState();
}

class _ItemMenuWidgetState extends State<ItemMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: AppColors.purpleLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: TextWidget.link(text: widget.title),
    );
  }
}

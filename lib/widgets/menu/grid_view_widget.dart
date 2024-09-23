import 'package:flutter/material.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/widgets/utils/item_menu_widget.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: const [
        ItemMenuWidget(title: "Teste"),
        ItemMenuWidget(title: "Teste 2"),
        ItemMenuWidget(title: "Teste 3"),
        ItemMenuWidget(title: "Teste 4"),
        ItemMenuWidget(title: "Teste 5"),
        ItemMenuWidget(title: "Teste 6"),
      ],
    );
  }
}

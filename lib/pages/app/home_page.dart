import 'package:flutter/material.dart';
import 'package:meu_das_flutter/widgets/menu/grid_view_widget.dart';
import 'package:meu_das_flutter/widgets/page/generic_app_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const GenericAppPageWidget(
      body: GridViewWidget(),
      pageIndex: 1,
    );
  }
}

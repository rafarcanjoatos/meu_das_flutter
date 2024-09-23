import 'package:flutter/material.dart';
import 'package:meu_das_flutter/widgets/page/generic_app_page_widget.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class DasboardPage extends StatefulWidget {
  DasboardPage({super.key});

  @override
  State<DasboardPage> createState() => _DasboardPageState();
}

class _DasboardPageState extends State<DasboardPage> {
  @override
  Widget build(BuildContext context) {
    return GenericAppPageWidget(
      body: TextWidget.description(text: "XYZ Company"),
      pageIndex: 0,
    );
  }
}

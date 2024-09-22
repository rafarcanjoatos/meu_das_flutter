import 'package:flutter/material.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/widgets/bar/bottom_navigation_bar_widget.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class DasboardPage extends StatefulWidget {
  DasboardPage({super.key});

  @override
  State<DasboardPage> createState() => _DasboardPageState();
}

class _DasboardPageState extends State<DasboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsetsDirectional.only(start: 40),
          child: TextWidget.logoSmall(
            text: AppStrings.appName,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 2.0,
            color: const Color.fromARGB(255, 179, 179, 179).withOpacity(0.7),
          ),
          const Expanded(
            child: Center(
              child: Text('Conteúdo do Dashboard'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(currentPageIndex: 0),
    );
  }
}

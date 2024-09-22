import 'package:flutter/material.dart';
import 'package:meu_das_flutter/widgets/bar/app_bar_widget.dart';
import 'package:meu_das_flutter/widgets/bar/bottom_navigation_bar_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          Container(
            height: 2.0,
            color: const Color.fromARGB(255, 179, 179, 179).withOpacity(0.7),
          ),
          const Expanded(
            child: Center(
              child: Text('Conteúdo do App'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(currentPageIndex: 1),
    );
  }
}

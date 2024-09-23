import 'package:flutter/material.dart';
import 'package:meu_das_flutter/widgets/bar/app_bar_widget.dart';
import 'package:meu_das_flutter/widgets/bar/bottom_navigation_bar_widget.dart';

class GenericAppPageWidget extends StatefulWidget {
  Widget body;
  int pageIndex;
  GenericAppPageWidget({
    super.key,
    required this.body,
    required this.pageIndex,
  });

  @override
  State<GenericAppPageWidget> createState() => _GenericAppPageWidgetState();
}

class _GenericAppPageWidgetState extends State<GenericAppPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            SizedBox(
              height: 650,
              width: double.infinity,
              child: Center(
                child: widget.body,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBarWidget(currentPageIndex: widget.pageIndex),
    );
  }
}

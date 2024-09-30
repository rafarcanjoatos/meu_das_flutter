import 'package:flutter/material.dart';
import 'package:meu_das_flutter/services/company_service.dart';
import 'package:meu_das_flutter/widgets/bar/app_bar_widget.dart';
import 'package:meu_das_flutter/widgets/bar/bottom_navigation_bar_widget.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class GenericAppPageWidget extends StatefulWidget {
  final Widget body;
  final int pageIndex;

  const GenericAppPageWidget({
    super.key,
    required this.body,
    required this.pageIndex,
  });

  @override
  State<GenericAppPageWidget> createState() => _GenericAppPageWidgetState();
}

class _GenericAppPageWidgetState extends State<GenericAppPageWidget> {
  CompanyService company = CompanyService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: company.consumerApi(),
              builder: (context, value) {
                return TextWidget.description(
                  text: value.data?.razaoSocial ?? "",
                );
              },
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: widget.body,
                ),
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

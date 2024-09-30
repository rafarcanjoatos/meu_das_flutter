import 'package:flutter/material.dart';
import 'package:meu_das_flutter/services/company_service.dart';
import 'package:meu_das_flutter/widgets/bar/app_bar_widget.dart';
import 'package:meu_das_flutter/widgets/bar/bottom_navigation_bar_widget.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class GenericAppPageWidget extends StatefulWidget {
  final Widget body;
  final int pageIndex;
  final double paddingBorder;
  final double paddingCompanyHeader;
  final bool companyHeader;

  const GenericAppPageWidget({
    super.key,
    required this.body,
    this.pageIndex = 1,
    this.paddingBorder = 30.0,
    this.paddingCompanyHeader = 12,
    this.companyHeader = true,
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
        padding: EdgeInsets.all(widget.paddingBorder),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.companyHeader == true
                ? FutureBuilder(
                    future: company.consumerApi(),
                    builder: (context, value) {
                      return TextWidget.description(
                        text: value.data?.razaoSocial ?? "",
                      );
                    },
                  )
                : const SizedBox.shrink(),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: widget.paddingCompanyHeader),
            ),
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

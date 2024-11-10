import 'package:flutter/material.dart';
import 'package:meuDas/pages/app/home_page.dart';
import 'package:meuDas/utils/app_strings.dart';
import 'package:meuDas/widgets/page/generic_app_page_widget.dart';
import 'package:meuDas/widgets/utils/table_das_histories.dart';

class DasHistoryPage extends StatefulWidget {
  const DasHistoryPage({super.key});

  @override
  State<DasHistoryPage> createState() => _DasHistoryPageState();
}

class _DasHistoryPageState extends State<DasHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return GenericAppPageWidget(
      body: const TableDasHistories(),
      pageIndex: 1,
      paddingBorder: 0,
      companyHeader: false,
      paddingCompanyHeader: 0,
      title: AppStrings.menuTitles["dasHistory"],
      page: const HomePage(),
    );
  }
}

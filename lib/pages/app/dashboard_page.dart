import 'package:flutter/material.dart';
import 'package:meuDas/widgets/page/generic_app_page_widget.dart';
import 'package:meuDas/widgets/utils/table_das_histories.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return const GenericAppPageWidget(
      body: TableDasHistories(
        hasRbtContainer: true,
      ),
      pageIndex: 0,
      paddingBorder: 0,
      companyHeader: false,
      title: "Dashboard",
      paddingCompanyHeader: 0,
      hasOverlay: true,
    );
  }
}

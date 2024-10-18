import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/app/home_page.dart';
import 'package:meu_das_flutter/widgets/page/generic_app_page_widget.dart';
import 'package:meu_das_flutter/widgets/utils/table_das_histories.dart';

class DasHistoryPage extends StatefulWidget {
  const DasHistoryPage({super.key});

  @override
  State<DasHistoryPage> createState() => _DasHistoryPageState();
}

class _DasHistoryPageState extends State<DasHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return const GenericAppPageWidget(
      body: TableDasHistories(),
      pageIndex: 1,
      paddingBorder: 0,
      companyHeader: false,
      page: HomePage(),
    );
  }
}

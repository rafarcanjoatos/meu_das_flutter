import 'package:flutter/material.dart';
import 'package:meuDas/pages/app/company_info_page.dart';
import 'package:meuDas/pages/app/das_history_page.dart';
import 'package:meuDas/pages/app/das_page.dart';
import 'package:meuDas/pages/app/dashboard_page.dart';
import 'package:meuDas/pages/app/user_info_page.dart';
import 'package:meuDas/utils/app_strings.dart';
import 'package:meuDas/widgets/utils/item_menu_widget.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ItemMenuWidget(
                icon: Icons.description,
                title: AppStrings.menuTitles["generateDas"] ?? "",
                page: const DasPage(),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(
            bottom: 16,
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
            padding: EdgeInsets.zero,
            children: [
              ItemMenuWidget(
                icon: Icons.person,
                title: AppStrings.menuTitles["myData"] ?? "",
                page: const UserInfoPage(),
              ),
              ItemMenuWidget(
                icon: Icons.apartment,
                title: AppStrings.menuTitles["companyData"] ?? "",
                page: const CompanyInfoPage(),
              ),
              ItemMenuWidget(
                icon: Icons.bar_chart,
                title: AppStrings.menuTitles["dashboard"] ?? "",
                page: const DashboardPage(),
              ),
              ItemMenuWidget(
                icon: Icons.folder_open,
                title: AppStrings.menuTitles["dasHistory"] ?? "",
                page: const DasHistoryPage(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

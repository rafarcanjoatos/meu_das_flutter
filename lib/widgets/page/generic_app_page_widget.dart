import 'package:flutter/material.dart';
import 'package:meu_das_flutter/services/cache_manager_service.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/widgets/bar/app_bar_widget.dart';
import 'package:meu_das_flutter/widgets/bar/bottom_navigation_bar_widget.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class GenericAppPageWidget extends StatefulWidget {
  final Widget body;
  final int pageIndex;
  final double paddingBorder;
  final double paddingCompanyHeader;
  final bool companyHeader;
  final String? title;
  final bool hasOverlay;
  final Widget? page;
  final bool hasLeading;

  const GenericAppPageWidget({
    super.key,
    required this.body,
    this.pageIndex = 1,
    this.paddingBorder = 30.0,
    this.paddingCompanyHeader = 12,
    this.companyHeader = true,
    this.title = " ",
    this.hasOverlay = false,
    this.hasLeading = true,
    this.page,
  });

  @override
  State<GenericAppPageWidget> createState() => _GenericAppPageWidgetState();
}

class _GenericAppPageWidgetState extends State<GenericAppPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        page: widget.page,
        hasLeading: widget.hasLeading,
      ),
      body: Padding(
        padding: EdgeInsets.all(widget.paddingBorder),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.companyHeader == true
                ? FutureBuilder(
                    future: CacheManagerService.getCompanyData(),
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
            Align(
              alignment: Alignment.centerLeft,
              child: widget.title != " "
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextWidget.title2(
                        text: widget.title!,
                        color: AppColors.black,
                      ),
                    )
                  : const SizedBox.shrink(),
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
      bottomNavigationBar: BottomNavigationBarWidget(
        currentPageIndex: widget.pageIndex,
        hasOverlay: widget.hasOverlay,
      ),
    );
  }
}

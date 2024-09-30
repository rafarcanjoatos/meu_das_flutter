import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/app/home_page.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:meu_das_flutter/widgets/modal/dialog_modal.dart';
import 'package:meu_das_flutter/widgets/page/generic_app_page_widget.dart';
import 'package:meu_das_flutter/widgets/utils/button_widget.dart';
import 'package:meu_das_flutter/widgets/utils/dropdown_month_widget.dart';
import 'package:meu_das_flutter/widgets/utils/input_widget.dart';

class DasPage extends StatefulWidget {
  const DasPage({super.key});

  @override
  State<DasPage> createState() => _DasPageState();
}

class _DasPageState extends State<DasPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GenericAppPageWidget(
      body: Column(
        children: [
          InputWidget(
            hintText: AppStrings.dasMoneyBilling,
            controller: controller,
            title: AppStrings.dasMoneyBilling,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          const DropdownMonthWidget(
            title: AppStrings.dasSelectTheMonth,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          ButtonWidget(
            onPressed: () => NavigatorUtils.navigatorScreen(
              context,
              const DialogModal(
                title: AppStrings.modalConfirmDasGeneration,
                description: AppStrings.modalAreYouSure,
                page: HomePage(),
              ),
            ),
            buttonText: AppStrings.buttonDasGenerate,
          )
        ],
      ),
      pageIndex: 0,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/app/home_page.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/widgets/modal/dialog_modal.dart';
import 'package:meu_das_flutter/widgets/page/das_model_page_widget.dart';
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
            title: AppStrings.dasMoneyBilling,
            hintText: AppStrings.dasMoneyBillingHintText,
            controller: controller,
            keyboardType: TextInputType.number,
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogModal(
                    title: AppStrings.modalConfirmDasGeneration,
                    description: AppStrings.modalAreYouSure,
                    page: DasModelPageWidget(),
                  );
                },
              );
            },
            buttonText: AppStrings.buttonDasGenerate,
          )
        ],
      ),
      pageIndex: 0,
    );
  }
}

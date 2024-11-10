import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:meuDas/models/das_history_model.dart';
import 'package:meuDas/services/cache_manager_service.dart';
import 'package:meuDas/utils/app_strings.dart';
import 'package:meuDas/widgets/modal/dialog_modal.dart';
import 'package:meuDas/widgets/page/das_model_page_widget.dart';
import 'package:meuDas/widgets/page/generic_app_page_widget.dart';
import 'package:meuDas/widgets/utils/button_widget.dart';
import 'package:meuDas/widgets/utils/dropdown_month_widget.dart';
import 'package:meuDas/widgets/utils/input_widget.dart';

class DasPage extends StatefulWidget {
  const DasPage({super.key});

  @override
  State<DasPage> createState() => _DasPageState();
}

class _DasPageState extends State<DasPage> {
  List<DasHistoryModel>? dasHistory;
  Future<void> _loadDasHistory() async {
    dasHistory = await CacheManagerService.getDasHistoryData() ?? [];
  }

  @override
  void initState() {
    super.initState();
    _loadDasHistory();
  }

  final MoneyMaskedTextController controllerMoneyBilling =
      MoneyMaskedTextController(
    initialValue: 0.0,
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: 'R\$',
  );

  final _inputKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _monthKey = GlobalKey<FormState>();
  String? selectedMonth;

  @override
  Widget build(BuildContext context) {
    return GenericAppPageWidget(
      body: Column(
        children: [
          Form(
            key: _inputKey,
            child: InputWidget(
              title: AppStrings.dasMoneyBilling,
              hintText: AppStrings.dasMoneyBillingHintText,
              controller: controllerMoneyBilling,
              keyboardType: TextInputType.number,
              validation: (value) => _billingValidation(value),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          Form(
            key: _monthKey,
            child: DropdownMonthWidget(
              title: AppStrings.dasSelectTheMonth,
              onMonthChanged: (newMonth) {
                setState(() {
                  selectedMonth = newMonth;
                });
              },
              validator: (value) => _monthDasValidation(value),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          ButtonWidget(
            onPressed: () {
              if ((_monthKey.currentState?.validate() ?? false) &&
                  (_inputKey.currentState?.validate() ?? false)) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogModal(
                      title: AppStrings.modalConfirmDasGeneration,
                      description: AppStrings.modalAreYouSure,
                      page: DasModelPageWidget(
                        moneyBilling: controllerMoneyBilling,
                        selectedMonth: selectedMonth,
                      ),
                    );
                  },
                );
              }
              ;
            },
            buttonText: AppStrings.buttonDasGenerate,
          )
        ],
      ),
      pageIndex: 0,
    );
  }

  _billingValidation(String value) {
    String cleanedValue = value.replaceAll(RegExp(r'[^\d,]'), '');
    cleanedValue = cleanedValue.replaceAll(',', '.');
    double billingValue = double.tryParse(cleanedValue) ?? 0.0;

    if (billingValue == 0) {
      return AppStrings.billingError;
    }

    return null;
  }

  _monthDasValidation(String? month) {
    if (month == null || dasHistory == null) return null;

    for (var entry in dasHistory!) {
      if (entry.month == month && entry.status != "VENCIDO") {
        return "Já existe um DAS para o mês $month que não está vencido.";
      }
    }
    return null;
  }
}

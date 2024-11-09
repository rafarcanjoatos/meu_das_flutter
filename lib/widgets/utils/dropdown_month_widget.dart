import 'package:flutter/material.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class DropdownMonthWidget extends StatefulWidget {
  final String title;
  final ValueChanged<String?> onMonthChanged;

  const DropdownMonthWidget({
    super.key,
    this.title = " ",
    required this.onMonthChanged,
  });

  @override
  State<DropdownMonthWidget> createState() => _DropdownMonthWidgetState();
}

class _DropdownMonthWidgetState extends State<DropdownMonthWidget> {
  List<String?> months = [
    AppStrings.yearMonths['january'],
    AppStrings.yearMonths['february'],
    AppStrings.yearMonths['march'],
    AppStrings.yearMonths['april'],
    AppStrings.yearMonths['may'],
    AppStrings.yearMonths['june'],
    AppStrings.yearMonths['july'],
    AppStrings.yearMonths['august'],
    AppStrings.yearMonths['september'],
    AppStrings.yearMonths['october'],
    AppStrings.yearMonths['november'],
    AppStrings.yearMonths['december'],
  ];

  String? selectedMonth;

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    int currentMonthIndex = now.month - 1;
    selectedMonth = months[currentMonthIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.title != " "
            ? Align(
                alignment: Alignment.centerLeft,
                child: TextWidget.title2(
                  text: widget.title,
                ),
              )
            : const SizedBox.shrink(),
        DropdownButtonFormField<String>(
          value: selectedMonth,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: months.map((String? month) {
            return DropdownMenuItem<String>(
              value: month,
              child: Text(month!),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedMonth = newValue;
              widget.onMonthChanged(newValue);
            });
          },
        ),
      ],
    );
  }
}

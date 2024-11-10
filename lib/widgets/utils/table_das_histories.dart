import 'package:flutter/material.dart';
import 'package:meuDas/models/das_history_model.dart';
import 'package:meuDas/services/cache_manager_service.dart';
import 'package:meuDas/utils/app_colors.dart';
import 'package:meuDas/utils/date_format_utils.dart';
import 'package:meuDas/widgets/utils/text_widget.dart';

class TableDasHistories extends StatefulWidget {
  final bool hasRbtContainer;
  const TableDasHistories({
    super.key,
    this.hasRbtContainer = false,
  });

  @override
  State<TableDasHistories> createState() => _TableDasHistoriesState();
}

class _TableDasHistoriesState extends State<TableDasHistories> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DasHistoryModel>?>(
      future: CacheManagerService.getDasHistoryData(),
      builder: (context, snapshot) {
        final dasHistories = snapshot.data ?? [];
        final rbt12 = calculateRbt12(dasHistories);

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (dasHistories.isEmpty) {
          return Center(
            child: TextWidget.description(
                text: "Nenhum registro de DAS encontrado"),
          );
        }

        return Column(
          children: [
            widget.hasRbtContainer == true
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      color: AppColors.neutralLight.withOpacity(0.3),
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget.title2(text: "RBT 12"),
                          TextWidget.title3(
                            text: rbt12,
                            color: AppColors.black,
                          )
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Center(
              child: DataTable(
                columnSpacing: 15,
                columns: const [
                  DataColumn(
                    label: Text('Mês'),
                  ),
                  DataColumn(
                    label: Text('Valor'),
                  ),
                  DataColumn(
                    label: Text('Emissão'),
                  ),
                  DataColumn(
                    label: Text('Vencimento'),
                  ),
                  DataColumn(
                    label: Text('Status'),
                  ),
                ],
                rows: dasHistories.map((item) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(item.month.toString()),
                      ),
                      DataCell(
                        Text(item.value.toString()),
                      ),
                      DataCell(
                        Text(
                          DateFormatUtils.formatDate(
                            DateTime.parse(item.issueDate!),
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          textAlign: TextAlign.center,
                          DateFormatUtils.formatDate(
                            DateTime.parse(item.dueDate!),
                          ),
                        ),
                      ),
                      DataCell(
                        Text(item.status.toString()),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

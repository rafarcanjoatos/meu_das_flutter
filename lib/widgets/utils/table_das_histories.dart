import 'package:flutter/material.dart';
import 'package:meu_das_flutter/models/das_history_model.dart';
import 'package:meu_das_flutter/services/das_history_service.dart';
import 'package:meu_das_flutter/utils/date_format_utils.dart';

class TableDasHistories extends StatefulWidget {
  const TableDasHistories({super.key});

  @override
  State<TableDasHistories> createState() => _TableDasHistoriesState();
}

class _TableDasHistoriesState extends State<TableDasHistories> {
  DasHistoryService dasHistory = DasHistoryService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DasHistoryModel>?>(
      future: dasHistory.consumerApi(),
      builder: (context, snapshot) {
        final dasHistories = snapshot.data ?? [];

        return Column(
          children: [
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

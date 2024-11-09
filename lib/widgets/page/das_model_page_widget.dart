import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:meu_das_flutter/pages/app/das_history_page.dart';
import 'package:meu_das_flutter/services/cache_manager_service.dart';
import 'package:meu_das_flutter/utils/date_format_utils.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DasModelPageWidget extends StatefulWidget {
  final MoneyMaskedTextController moneyBilling;
  final String? selectedMonth;
  const DasModelPageWidget({
    super.key,
    required this.moneyBilling,
    required this.selectedMonth,
  });

  @override
  State<DasModelPageWidget> createState() => _DasModelPageWidgetState();
}

class _DasModelPageWidgetState extends State<DasModelPageWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String issueDate = DateFormat('yyyy-MM-dd').format(now);
    String periodDate = DateFormat('MMM/yy').format(now);
    String dueDate =
        DateFormatUtils.formatDate(now.add(const Duration(days: 5)));
    double tax = calculateTax(widget.moneyBilling);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => NavigatorUtils.navigatorScreen(
            context,
            const DasHistoryPage(),
          ),
        ),
        title: const Text('Documento de Arrecadação do Simples Nacional'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () => _generatePdf(
              widget.moneyBilling,
              tax,
              dueDate,
              periodDate,
              issueDate,
              context,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Documento de Arrecadação do Simples Nacional',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const Text('CNPJ: 27.339.063/0001-23',
                  style: TextStyle(fontSize: 16)),
              const Text('Número do Documento: 07.20.18310.6186667-1',
                  style: TextStyle(fontSize: 16)),
              Text('Data de Vencimento: $dueDate',
                  style: const TextStyle(fontSize: 16)),
              Text('Período de Apuração: $periodDate',
                  style: const TextStyle(fontSize: 16)),
              Text('Valor Total do Documento: ${widget.moneyBilling.text}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text('Composição do Documento de Arrecadação',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(color: Colors.black),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(3),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(2),
                },
                children: [
                  TableRow(children: [
                    _buildTableCell('Código Principal', isHeader: true),
                    _buildTableCell('Denominação', isHeader: true),
                    _buildTableCell('Total', isHeader: true),
                    _buildTableCell('Multa', isHeader: true),
                    _buildTableCell('Juros', isHeader: true),
                  ]),
                  _buildTableRow(
                    '1001',
                    'DAS - SIMPLES NACIONAL',
                    // ignore: unnecessary_string_interpolations
                    '${tax.toStringAsFixed(2)}',
                    '0.0',
                    '0.0',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Totais',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text('Valor Total: ${widget.moneyBilling.text}',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  TableCell _buildTableCell(String text, {bool isHeader = false}) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String code, String denomination, String total,
      String fine, String taxes) {
    return TableRow(children: [
      _buildTableCell(code),
      _buildTableCell(denomination),
      _buildTableCell(total),
      _buildTableCell(fine),
      _buildTableCell(taxes),
    ]);
  }

  void _generatePdf(
    MoneyMaskedTextController moneyBilling,
    double tax,
    String dueDate,
    String periodDate,
    String issueDate,
    BuildContext context,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text(
                  'Documento de Arrecadação do Simples Nacional',
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text('CNPJ: 27.339.063/0001-23',
                  style: const pw.TextStyle(fontSize: 16)),
              pw.Text('Número do Documento: 07.20.18310.6186667-1',
                  style: const pw.TextStyle(fontSize: 16)),
              pw.Text('Data de Vencimento: $dueDate',
                  style: const pw.TextStyle(fontSize: 16)),
              pw.Text('Período de Apuração: $periodDate',
                  style: const pw.TextStyle(fontSize: 16)),
              pw.Text('Valor Total do Documento: ${moneyBilling.text}',
                  style: const pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 20),
              pw.Text('Composição do Documento de Arrecadação',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.TableHelper.fromTextArray(
                headers: [
                  'Código Principal',
                  'Denominação',
                  'Total',
                  'Multa',
                  'Juros'
                ],
                data: [
                  [
                    '1001',
                    'IRPJ - SIMPLES NACIONAL',
                    // ignore: unnecessary_string_interpolations
                    '${tax.toStringAsFixed(2)}',
                    '0.0',
                    '0.0'
                  ],
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text('Totais',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('Valor Total: ${moneyBilling.text}',
                  style: const pw.TextStyle(fontSize: 16)),
            ],
          );
        },
      ),
    );

    final Map<String, dynamic> newEntry = {
      "cnpj": "27.339.063/0001-23",
      "documentNumber": "07.20.18310.6186667-1",
      "month": periodDate,
      "value": moneyBilling.numberValue,
      "issueDate": issueDate,
      "dueDate": dueDate,
      "status": "Gerado"
    };

    await CacheManagerService.insertDasHistoryData(newEntry);

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }

  double calculateTax(MoneyMaskedTextController moneyBilling) {
    String value = moneyBilling.text;

    double numericValue = double.parse(
            value.replaceAll(RegExp(r'[R\$,.]'), '').replaceAll(' ', '')) /
        100;

    double interestRate = numericValue * 0.15;

    return interestRate;
  }
}

import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/app/das_history_page.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DasModelPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => NavigatorUtils.navigatorScreen(
            context,
            const DasHistoryPage(),
          ),
        ),
        title: Text('Documento de Arrecadação do Simples Nacional'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () => _generatePdf(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Documento de Arrecadação do Simples Nacional',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Text('CNPJ: 27.339.063/0001-23', style: TextStyle(fontSize: 16)),
              Text('Número do Documento: 07.20.18310.6186667-1',
                  style: TextStyle(fontSize: 16)),
              Text('Data de Vencimento: 20/11/2018',
                  style: TextStyle(fontSize: 16)),
              Text('Período de Apuração: Outubro/2018',
                  style: TextStyle(fontSize: 16)),
              Text('Valor Total do Documento: R\$ 2.000,00',
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Text('Composição do Documento de Arrecadação',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Table(
                border: TableBorder.all(color: Colors.black),
                columnWidths: {
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
                  _buildTableRow('1001', 'IRPJ - SIMPLES NACIONAL',
                      'R\$ 110,00', 'R\$ 110,00', 'R\$ 110,00'),
                  _buildTableRow('1002', 'CSLL - SIMPLES NACIONAL', 'R\$ 70,00',
                      'R\$ 70,00', 'R\$ 70,00'),
                  _buildTableRow('1004', 'COFINS - SIMPLES NACIONAL',
                      'R\$ 254,80', 'R\$ 254,80', 'R\$ 254,80'),
                  _buildTableRow('1005', 'PIS - SIMPLES NACIONAL', 'R\$ 55,20',
                      'R\$ 55,20', 'R\$ 55,20'),
                  _buildTableRow('1006', 'INSS - SIMPLES NACIONAL',
                      'R\$ 830,00', 'R\$ 830,00', 'R\$ 830,00'),
                  _buildTableRow('1007', 'ICMS - SIMPLES NACIONAL',
                      'R\$ 680,00', 'R\$ 680,00', 'R\$ 680,00'),
                ],
              ),
              SizedBox(height: 20),
              Text('Totais',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Valor Total: R\$ 2.000,00', style: TextStyle(fontSize: 16)),
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

  TableRow _buildTableRow(String codigo, String denominacao, String total,
      String multa, String juros) {
    return TableRow(children: [
      _buildTableCell(codigo),
      _buildTableCell(denominacao),
      _buildTableCell(total),
      _buildTableCell(multa),
      _buildTableCell(juros),
    ]);
  }

  void _generatePdf(BuildContext context) async {
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
                  style: pw.TextStyle(fontSize: 16)),
              pw.Text('Número do Documento: 07.20.18310.6186667-1',
                  style: pw.TextStyle(fontSize: 16)),
              pw.Text('Data de Vencimento: 20/11/2018',
                  style: pw.TextStyle(fontSize: 16)),
              pw.Text('Período de Apuração: Outubro/2018',
                  style: pw.TextStyle(fontSize: 16)),
              pw.Text('Valor Total do Documento: R\$ 2.000,00',
                  style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 20),
              pw.Text('Composição do Documento de Arrecadação',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Table.fromTextArray(
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
                    'R\$ 110,00',
                    'R\$ 110,00',
                    'R\$ 110,00'
                  ],
                  [
                    '1002',
                    'CSLL - SIMPLES NACIONAL',
                    'R\$ 70,00',
                    'R\$ 70,00',
                    'R\$ 70,00'
                  ],
                  [
                    '1004',
                    'COFINS - SIMPLES NACIONAL',
                    'R\$ 254,80',
                    'R\$ 254,80',
                    'R\$ 254,80'
                  ],
                  [
                    '1005',
                    'PIS - SIMPLES NACIONAL',
                    'R\$ 55,20',
                    'R\$ 55,20',
                    'R\$ 55,20'
                  ],
                  [
                    '1006',
                    'INSS - SIMPLES NACIONAL',
                    'R\$ 830,00',
                    'R\$ 830,00',
                    'R\$ 830,00'
                  ],
                  [
                    '1007',
                    'ICMS - SIMPLES NACIONAL',
                    'R\$ 680,00',
                    'R\$ 680,00',
                    'R\$ 680,00'
                  ],
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text('Totais',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('Valor Total: R\$ 2.000,00',
                  style: pw.TextStyle(fontSize: 16)),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }
}

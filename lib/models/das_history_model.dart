import 'package:intl/intl.dart';

class DasHistoryModel {
  String? cnpj;
  String? documentNumber;
  String? month;
  double? value;
  String? issueDate;
  String? dueDate;
  String? status;

  DasHistoryModel.fromJson(Map<String, dynamic> json) {
    cnpj = json["cnpj"];
    documentNumber = json["documentNumber"];
    month = json["month"];
    value = json["value"];
    issueDate = json["issueDate"];
    dueDate = json["dueDate"];
    status = json["status"];
  }
}

String calculateRbt12(List<DasHistoryModel> dasHistory) {
  double sum = 0.0;
  final int year = DateTime.now().year;

  for (var history in dasHistory) {
    final DateTime issueDate = DateTime.parse(history.issueDate!);
    if (issueDate.year == year) {
      final double valor = history.value!;
      sum += valor;
    }
  }

  final String valorFormatado =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(sum);
  return valorFormatado;
}

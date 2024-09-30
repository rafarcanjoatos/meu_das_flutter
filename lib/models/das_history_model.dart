class DasHistoryModel {
  String? month;
  String? value;
  String? issueDate;
  String? dueDate;
  String? status;

  DasHistoryModel.fromJson(Map<String, dynamic> json) {
    month = json["month"];
    value = json["value"];
    issueDate = json["issueDate"];
    dueDate = json["dueDate"];
    status = json["status"];
  }
}

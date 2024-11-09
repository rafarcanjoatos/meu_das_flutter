class NotificationModel {
  int? id;
  String? title;
  String? message;
  String? timestamp;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    message = json["message"];
    timestamp = json["timestamp"];
  }
}

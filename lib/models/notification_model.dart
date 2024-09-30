class NotificationModel {
  String? title;
  String? message;
  String? timestamp;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    message = json["message"];
    timestamp = json["timestamp"];
  }
}

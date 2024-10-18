import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:meu_das_flutter/models/notification_model.dart';

class NotificationService {
  Future<List<NotificationModel>?> consumerApi() async {
    try {
      String jsonString =
          await rootBundle.loadString('lib/fake_api/notification.json');

      Map<String, dynamic> responseMap = jsonDecode(jsonString);
      List<dynamic> notificationsJson = responseMap['notifications'];

      List<NotificationModel> notifications = notificationsJson
          .map((notification) => NotificationModel.fromJson(notification))
          .toList();

      return notifications;
    } catch (e) {
      //print("Erro ao carregar o arquivo JSON: $e");
      return null;
    }
  }

  Future<int> getNotificationCount() async {
    List<NotificationModel>? notifications = await consumerApi();
    return notifications?.length ?? 0;
  }
}

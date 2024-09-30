import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:meu_das_flutter/models/das_history_model.dart';

class DasHistoryService {
  Future<List<DasHistoryModel>?> consumerApi() async {
    try {
      String jsonString =
          await rootBundle.loadString('lib/fake_api/das_history.json');

      Map<String, dynamic> responseMap = jsonDecode(jsonString);
      List<dynamic> dasHistoryJson = responseMap['das_history'];

      List<DasHistoryModel> dasHistories = dasHistoryJson
          .map((dasHistory) => DasHistoryModel.fromJson(dasHistory))
          .toList();

      return dasHistories;
    } catch (e) {
      print("Erro ao carregar o arquivo JSON: $e");
      return null;
    }
  }

  Future<int> getNotificationCount() async {
    List<DasHistoryModel>? dasHistories = await consumerApi();
    return dasHistories?.length ?? 0;
  }
}

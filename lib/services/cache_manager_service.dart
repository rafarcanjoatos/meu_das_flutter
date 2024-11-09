import 'dart:convert';
import 'dart:io';

import 'package:meu_das_flutter/models/company_model.dart';
import 'package:meu_das_flutter/models/das_history_model.dart';
import 'package:meu_das_flutter/models/notification_model.dart';
import 'package:meu_das_flutter/models/user_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class CacheManagerService {
  static Future<void> initializeData() async {
    bool recreateDataForTests = true;

    Map<String, dynamic> companyData = {
      "cnpj": "56.443.512/0001-87",
      "razaoSocial": "Das Tecnologia LTDA",
      "nomeFantasia": "Meudas",
      "dataAbertura": "12/08/2024 há 29 dias",
      "porte": "ME",
      "naturezaJuridica": "Sociedade Empresária Limitada",
      "opcaoPeloMei": false,
      "capitalSocial": 36000.00,
      "tipo": "Matriz",
      "situacao": "Ativa",
      "dataSituacaoCadastral": "12/08/2024"
    };

    Map<String, dynamic> userData = {
      "cpf": "187.745.160-60",
      "fullName": "João da Silva",
      "email": "joao.silva@gmail.com",
      "telephone": "(47)9.9168-6307"
    };

    Map<String, dynamic> notificationData = {
      "notifications": [
        {
          "id": 1,
          "title": "Vencimento DAS",
          "message": "Pague hoje mesmo sua DAS de Outubro.",
          "timestamp": "2024-10-15T17:55:00Z"
        },
        {
          "id": 2,
          "title": "Atualização Disponível",
          "message": "Uma nova versão do aplicativo está disponível.",
          "timestamp": "2024-10-29T22:55:00Z"
        },
        {
          "id": 3,
          "title": "Imposto Vencido",
          "message": "Sua DAS Venceu no dia 27 de Outubro",
          "timestamp": "2024-11-01T09:10:00Z"
        },
        {
          "id": 4,
          "title": "Gerar DAS",
          "message": "Está na hora de gerar sua DAS",
          "timestamp": "2024-11-10T13:00:00Z"
        },
        {
          "id": 5,
          "title": "Vencimento DAS",
          "message": "Não esqueça o pagamento da sua DAS",
          "timestamp": "2024-11-15T08:32:00Z"
        }
      ]
    };

    Map<String, dynamic> dasHistoryData = {
      "dasHistory": [
        {
          "cnpj": "56.443.512/0001-87",
          "documentNumber": "07.20.18310.6186667-1",
          "month": "SEP/24",
          "value": "120.00",
          "issueDate": "2024-09-02T00:00:00",
          "dueDate": "2024-09-07T00:00:00",
          "status": "VENCIDO"
        }
      ]
    };

    Directory? downloadDirectory = await getDownloadsDirectory();

    if (downloadDirectory != null) {
      File companyFile = File("${downloadDirectory.path}/company.json");
      File userFile = File("${downloadDirectory.path}/user.json");
      File notificationFile =
          File("${downloadDirectory.path}/notification.json");
      File dasHistoryFile = File("${downloadDirectory.path}/dasHistory.json");

      if (!companyFile.existsSync() || recreateDataForTests == true) {
        await companyFile.writeAsString(jsonEncode(companyData));
        companyFile.createSync();
      }

      if (!userFile.existsSync() || recreateDataForTests == true) {
        await userFile.writeAsString(jsonEncode(userData));
        userFile.createSync();
      }

      if (!notificationFile.existsSync() || recreateDataForTests == true) {
        await notificationFile.writeAsString(jsonEncode(notificationData));
        notificationFile.createSync();
      }

      if (!dasHistoryFile.existsSync() || recreateDataForTests == true) {
        await dasHistoryFile.writeAsString(jsonEncode(dasHistoryData));
        dasHistoryFile.createSync();
      }
    }
  }

  static Future<CompanyModel?> getCompanyData() async {
    return await _getData<CompanyModel>(CompanyModel.fromJson, "company.json");
  }

  static Future<void> updateCompanyData(Map<String, dynamic> newEntry) async {
    await _updateData(newEntry, "company.json");
  }

  static Future<UserModel?> getUserData() async {
    return await _getData<UserModel>(UserModel.fromJson, "user.json");
  }

  static Future<void> updateUserData(String email, String telephone) async {
    var userData = await getUserData();

    if (userData != null) {
      userData.cpf = userData.cpf;
      userData.fullName = userData.fullName;
      userData.email = email;
      userData.telephone = telephone;

      Map<String, dynamic> newEntry = userData.toJson();

      await _updateData(newEntry, "user.json");
    }
  }

  static Future<List<NotificationModel>?> getNotificationData() async {
    return await _getData<List<NotificationModel>?>(
        (Map<String, dynamic> json) {
      var data = json['notifications'] as List;
      return data.map((item) => NotificationModel.fromJson(item)).toList();
    }, "notification.json");
  }

  static Future<void> updateNotificationData(
      Map<String, dynamic> newEntry) async {
    await _updateData(newEntry, "notification.json");
  }

  static Future<void> insertNotificationData(
      Map<String, dynamic> newEntry) async {
    await _insertData(newEntry, "notification.json", 'notifications');
  }

  static Future<void> deleteNotificationData(int id) async {
    await _deleteData(id, "notification.json", 'notifications');
  }

  static Future<List<DasHistoryModel>?> getDasHistoryData() async {
    return await _getData<List<DasHistoryModel>?>(
      (Map<String, dynamic> json) {
        var data = json['dasHistory'] as List;
        return data.map((item) => DasHistoryModel.fromJson(item)).toList();
      },
      "dasHistory.json",
    );
  }

  static Future<void> updateDasHistoryData(
      Map<String, dynamic> newEntry) async {
    await _updateData(newEntry, "dasHistory.json");
  }

  static Future<void> insertDasHistoryData(
      Map<String, dynamic> newEntry) async {
    await _insertData(newEntry, "dasHistory.json", 'dasHistory');
  }

  static Future<T?> _getData<T>(
      T Function(Map<String, dynamic>) fromJson, String fileName) async {
    T? model;

    try {
      Directory? downloadDirectory = await getDownloadsDirectory();

      if (downloadDirectory != null) {
        File file = File("${downloadDirectory.path}/$fileName");

        if (file.existsSync()) {
          final String fileContent = file.readAsStringSync();

          if (fileContent.isNotEmpty) {
            final jsonData = jsonDecode(fileContent);

            if (jsonData is Map<String, dynamic>) {
              model = fromJson(jsonData);
            } else if (jsonData is List) {
              if (jsonData.isNotEmpty && jsonData[0] is Map<String, dynamic>) {
                model = fromJson(jsonData[0]);
              }
            } else {
              print("Tipo de dado JSON inesperado: ${jsonData.runtimeType}");
            }
          } else {
            print("O arquivo JSON está vazio.");
          }
        }
      }
    } catch (e) {
      print("Erro ao carregar o arquivo JSON: $e");
      return null;
    }

    return model;
  }

  static Future<void> _updateData(
      Map<String, dynamic> newEntry, String fileName) async {
    try {
      Directory? downloadDirectory = await getDownloadsDirectory();

      if (downloadDirectory != null) {
        File dataFile = File("${downloadDirectory.path}/$fileName");

        if (dataFile.existsSync()) {
          await dataFile.writeAsString(jsonEncode(newEntry));
        }
      }
    } catch (e) {
      //print("Erro ao carregar o arquivo JSON: $e");
    }
  }

  static Future<void> _insertData(
      Map<String, dynamic> newEntry, String fileName, String listKey) async {
    try {
      Directory? downloadDirectory = await getDownloadsDirectory();

      if (downloadDirectory != null) {
        File dataFile = File("${downloadDirectory.path}/$fileName");

        Map<String, dynamic> jsonMap = {};

        if (dataFile.existsSync()) {
          String currentData = await dataFile.readAsString();

          dynamic jsonData = jsonDecode(currentData);

          if (jsonData is Map<String, dynamic>) {
            jsonMap = jsonData;
          } else if (jsonData is List) {
            jsonMap[listKey] = jsonData;
          }
        }

        // Adiciona o novo dado na lista específica dentro do Map
        jsonMap.putIfAbsent(listKey, () => []).add(newEntry);

        await dataFile.writeAsString(jsonEncode(jsonMap));
      }
    } catch (e) {
      print("Erro ao inserir dados no arquivo JSON: $e");
    }
  }

  static Future<void> _deleteData(
      int id, String fileName, String listKey) async {
    try {
      Directory? downloadDirectory = await getDownloadsDirectory();

      if (downloadDirectory != null) {
        File dataFile = File("${downloadDirectory.path}/$fileName");

        if (dataFile.existsSync()) {
          String currentData = await dataFile.readAsString();

          Map<String, dynamic> jsonData = jsonDecode(currentData);

          List<dynamic> dataList = jsonData[listKey];

          dataList.removeWhere((item) => item["id"] == id);

          jsonData[listKey] = dataList;

          await dataFile.writeAsString(jsonEncode(jsonData));
        }
      }
    } catch (e) {
      print("Erro ao inserir dados no arquivo JSON: $e");
    }
  }
}

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:meu_das_flutter/models/company_model.dart';

class CompanyService {
  Future<UserModel?> consumerApi() async {
    try {
      String jsonString =
          await rootBundle.loadString('lib/fake_api/company.json');

      Map<String, dynamic> responseMap = jsonDecode(jsonString);
      return UserModel.fromJson(responseMap);
    } catch (e) {
      //print("Erro ao carregar o arquivo JSON: $e");
      return null;
    }
  }
}

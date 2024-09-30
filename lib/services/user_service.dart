import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:meu_das_flutter/models/user_model.dart';

class UserService {
  Future<UserModel?> consumerApi() async {
    try {
      String jsonString = await rootBundle.loadString('lib/fake_api/user.json');

      Map<String, dynamic> responseMap = jsonDecode(jsonString);
      return UserModel.fromJson(responseMap);
    } catch (e) {
      print("Erro ao carregar o arquivo JSON: $e");
      return null;
    }
  }
}

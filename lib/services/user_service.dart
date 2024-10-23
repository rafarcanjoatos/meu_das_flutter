import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:meu_das_flutter/models/user_model.dart';

class UserService {
  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return "${directory.path}/user.json";
  }

  Future<File> _getFile() async {
    final path = await _getFilePath();
    return File(path);
  }

  Future<UserModel?> consumerApi() async {
    try {
      String jsonString = await rootBundle.loadString('lib/fake_api/user.json');
      Map<String, dynamic> responseMap = jsonDecode(jsonString);

      File file = await _getFile();
      if (!(await file.exists())) {
        await file.writeAsString(jsonString);
      }

      String localJson = await file.readAsString();
      Map<String, dynamic> localResponseMap = jsonDecode(localJson);

      return UserModel.fromJson(localResponseMap);
    } catch (e) {
      return null;
    }
  }

  Future<void> updateUser(String email, String telefone) async {
    try {
      File file = await _getFile();

      String jsonString = await file.readAsString();
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      jsonMap['email'] = email;
      jsonMap['telefone'] = telefone;

      await file.writeAsString(jsonEncode(jsonMap));
    } catch (e) {}
  }
}

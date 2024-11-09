import 'package:flutter/material.dart';
import 'package:meu_das_flutter/my_app.dart';
import 'package:meu_das_flutter/services/cache_manager_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManagerService.initializeData();

  runApp(const MyApp());
}

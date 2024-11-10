import 'package:flutter/material.dart';
import 'package:meuDas/my_app.dart';
import 'package:meuDas/services/cache_manager_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManagerService.initializeData();

  runApp(const MyApp());
}

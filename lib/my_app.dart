import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/login/login_page.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu DAS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

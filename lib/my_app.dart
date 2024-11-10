import 'package:flutter/material.dart';
import 'package:meuDas/pages/login/login_page.dart';
import 'package:meuDas/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

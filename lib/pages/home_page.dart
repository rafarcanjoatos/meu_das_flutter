import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsetsDirectional.only(start: 40),
          child: Text(
            "meuDAS",
            style: GoogleFonts.ubuntu(
              color: AppColors.purple,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Divisor (borda) logo abaixo do AppBar
          Container(
            height: 2.0, // Altura da borda
            color: const Color.fromARGB(255, 179, 179, 179)
                .withOpacity(0.7), // Cor da borda com transparência
          ),
          Expanded(
            child: Center(
              child: Text('Conteúdo do App'),
            ),
          ),
        ],
      ),
    );
  }
}

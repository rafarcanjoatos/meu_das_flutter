import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';

abstract class ButtonUtils {
  static void button(
    BuildContext context,
    Widget page,
    String? controllerCpf,
    String? controllerPassword,
  ) {
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: AppColors.purple,
      ),
      onPressed: () {
        if (controllerCpf?.value.text == "admin" &&
            controllerPassword?.value.text == "admin") {
          NavigatorUtils.navigatorScreen(context, page);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login inválido'),
            ),
          );
        }
      },
      child: Text(
        "Entrar",
        style: GoogleFonts.ubuntu(
          color: Colors.white,
        ),
      ),
    );
  }
}

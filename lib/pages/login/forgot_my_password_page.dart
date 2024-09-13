import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_das_flutter/pages/home_page.dart';
import 'package:meu_das_flutter/pages/login/login_page.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/widgets/input_widget.dart';

class ForgotMyPasswordPage extends StatefulWidget {
  const ForgotMyPasswordPage({super.key});

  @override
  State<ForgotMyPasswordPage> createState() => _ForgotMyPasswordPageState();
}

class _ForgotMyPasswordPageState extends State<ForgotMyPasswordPage> {
  TextEditingController controllerCpf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock,
                  size: 80,
                  color: AppColors.purple,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                Text(
                  "Recuperação de Senha",
                  style: GoogleFonts.ubuntu(
                    fontSize: 25,
                    color: AppColors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 25)),
                Text(
                  "Preencha o seu CPF abaixo para receber uma senha provisória em seu e-mail",
                  style: GoogleFonts.ubuntu(
                    fontSize: 17,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 50)),
                InputWidget(
                  controller: controllerCpf,
                  hintText: "CPF",
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                ),
                const Padding(padding: EdgeInsets.only(top: 50)),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      backgroundColor: AppColors.purple,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return const LoginPage();
                          },
                        ),
                      );
                      return;
                    },
                    child: Text(
                      "Enviar",
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_das_flutter/pages/home_page.dart';
import 'package:meu_das_flutter/pages/login/forgot_my_password_page.dart';
import 'package:meu_das_flutter/utils/app_colors.dart';
import 'package:meu_das_flutter/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "meuDAS",
                  style: GoogleFonts.ubuntu(
                    color: AppColors.purple,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                InputWidget(
                  controller: controllerCpf,
                  hintText: "CPF",
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                InputWidget(
                  controller: controllerPassword,
                  hintText: "Senha",
                  keyboardType: TextInputType.visiblePassword,
                  obscure: true,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return const ForgotMyPasswordPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Esqueci Minha Senha",
                        style: GoogleFonts.ubuntu(
                          color: AppColors.purple,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
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
                      if (controllerCpf.value.text == "admin" &&
                          controllerPassword.value.text == "admin") {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return const HomePage();
                            },
                          ),
                        );
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login inválido'),
                        ),
                      );
                    },
                    child: Text(
                      "Entrar",
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

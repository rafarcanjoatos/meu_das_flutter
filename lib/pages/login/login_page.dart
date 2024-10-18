import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:meu_das_flutter/pages/app/home_page.dart';
import 'package:meu_das_flutter/pages/forgot_password/forgot_my_password_page.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:meu_das_flutter/utils/validate_utils.dart';
import 'package:meu_das_flutter/widgets/utils/button_widget.dart';
import 'package:meu_das_flutter/widgets/utils/input_widget.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidateUtils {
  final MaskedTextController controllerCpf =
      MaskedTextController(mask: '000.000.000-00');
  final TextEditingController controllerPassword = TextEditingController();

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
                TextWidget.logoBig(text: AppStrings.appName),
                const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                InputWidget(
                  controller: controllerCpf,
                  hintText: AppStrings.hintTextCpf,
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                  maxLenght: 15,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                InputWidget(
                  controller: controllerPassword,
                  hintText: AppStrings.hintTextPassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscure: true,
                  maxLenght: 20,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => NavigatorUtils.navigatorScreen(
                        context,
                        const ForgotMyPasswordPage(),
                      ),
                      child: TextWidget.link(
                        text: AppStrings.linkForgotMyPassword,
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 50)),
                ButtonWidget(
                  // Desligado para teste, Validação do login
                  // onPressed: () => ValidateUtils.login(context, controllerCpf,
                  //     controllerPassword, const HomePage()),
                  // buttonText: AppStrings.buttonLogin,

                  onPressed: () =>
                      NavigatorUtils.navigatorScreen(context, const HomePage()),
                  buttonText: AppStrings.buttonLogin,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

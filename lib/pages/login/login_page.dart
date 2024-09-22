import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/app/home_page.dart';
import 'package:meu_das_flutter/pages/forgot_password/forgot_my_password_page.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:meu_das_flutter/widgets/utils/button_widget.dart';
import 'package:meu_das_flutter/widgets/utils/input_widget.dart';
import 'package:meu_das_flutter/widgets/utils/text_widget.dart';

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
                TextWidget.logoBig(text: AppStrings.appName),
                const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                InputWidget(
                  controller: controllerCpf,
                  hintText: AppStrings.hintTextCpf,
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                InputWidget(
                  controller: controllerPassword,
                  hintText: AppStrings.hintTextPassword,
                  keyboardType: TextInputType.visiblePassword,
                  obscure: true,
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
                  onPressed: () =>
                      NavigatorUtils.navigatorScreen(context, HomePage()),
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

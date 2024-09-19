import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/email/email_sended_page.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:meu_das_flutter/widgets/generic_info_page_widget.dart';

class ForgotMyPasswordPage extends StatefulWidget {
  const ForgotMyPasswordPage({super.key});

  @override
  State<ForgotMyPasswordPage> createState() => _ForgotMyPasswordPageState();
}

class _ForgotMyPasswordPageState extends State<ForgotMyPasswordPage> {
  TextEditingController controllerCpf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GenericInfoPageWidget(
      icon: Icons.lock,
      title: "Recuperação de Senha",
      description:
          "Preencha o seu CPF abaixo para receber uma senha provisória em seu e-mail",
      controller: controllerCpf,
      hintText: "CPF",
      buttonText: "Enviar",
      onPressed: () =>
          NavigatorUtils.navigatorScreen(context, const EmailSendedPage()),
    );
  }
}

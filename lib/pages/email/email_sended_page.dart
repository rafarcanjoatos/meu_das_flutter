import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/login/login_page.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:meu_das_flutter/widgets/generic_info_page_widget.dart';

class EmailSendedPage extends StatefulWidget {
  const EmailSendedPage({super.key});

  @override
  State<EmailSendedPage> createState() => _EmailSendedPageState();
}

class _EmailSendedPageState extends State<EmailSendedPage> {
  TextEditingController controllerCpf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GenericInfoPageWidget(
      icon: Icons.check,
      title: "Verifique seu Email",
      description:
          "Enviamos sua senha provisória. Acesse seu e-mail e tente fazer o login novamente.",
      buttonText: "Tela de Login",
      onPressed: () =>
          NavigatorUtils.navigatorScreen(context, const LoginPage()),
    );
  }
}

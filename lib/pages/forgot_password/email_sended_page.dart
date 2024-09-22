import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/login/login_page.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:meu_das_flutter/widgets/page/generic_info_page_widget.dart';

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
      title: AppStrings.titleVerifyYourEmail,
      description: AppStrings.descriptionVerifyYourEmail,
      buttonText: AppStrings.buttonLoginPage,
      onPressed: () =>
          NavigatorUtils.navigatorScreen(context, const LoginPage()),
    );
  }
}

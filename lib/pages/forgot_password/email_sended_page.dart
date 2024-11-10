import 'package:flutter/material.dart';
import 'package:meuDas/pages/login/login_page.dart';
import 'package:meuDas/utils/app_strings.dart';
import 'package:meuDas/utils/navigator_utils.dart';
import 'package:meuDas/widgets/page/generic_info_page_widget.dart';

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
      validation: true,
      onPressed: () =>
          NavigatorUtils.navigatorScreen(context, const LoginPage()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:meu_das_flutter/pages/forgot_password/email_sended_page.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:meu_das_flutter/widgets/page/generic_info_page_widget.dart';

class ForgotMyPasswordPage extends StatefulWidget {
  const ForgotMyPasswordPage({super.key});

  @override
  State<ForgotMyPasswordPage> createState() => _ForgotMyPasswordPageState();
}

class _ForgotMyPasswordPageState extends State<ForgotMyPasswordPage> {
  final MaskedTextController controllerCpf =
      MaskedTextController(mask: '000.000.000-00');
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GenericInfoPageWidget(
      icon: Icons.lock,
      title: AppStrings.titleForgotMyPassword,
      description: AppStrings.descriptionForgotMyPassword,
      controller: controllerCpf,
      hintText: AppStrings.hintTextCpf,
      buttonText: AppStrings.buttonSend,
      onPressed: () =>
          NavigatorUtils.navigatorScreen(context, const EmailSendedPage()),
    );
  }
}
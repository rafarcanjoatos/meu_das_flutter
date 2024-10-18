import 'package:flutter/material.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';

mixin ValidateUtils {
  static void login(
    BuildContext context,
    TextEditingController controllerLogin,
    TextEditingController controllerPassword,
    Widget page,
  ) {
    if (!minLenght(controllerLogin.value.text, 11)) {
      showErrorMessage(context, AppStrings.cpfInvalid);
      return;
    }

    if (!isCPF(controllerLogin.value.text)) {
      showErrorMessage(context, AppStrings.cpfInvalid);
      return;
    }

    if (!minLenght(controllerPassword.value.text, 8)) {
      showErrorMessage(context, AppStrings.passwordInvalidCharacters);
      return;
    }

    if (controllerLogin.value.text == "098.470.629-19" &&
        controllerPassword.value.text == "12345678") {
      return NavigatorUtils.navigatorScreen(context, page);
    } else {
      showErrorMessage(context, AppStrings.loginInvalid);
    }
  }

  static bool minLenght(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return value.length >= minLength;
  }

  static bool isCPF(String? cpf) {
    if (cpf == null || cpf.isEmpty) return false;
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    if (cpf.length != 11 || RegExp(r'^(.)\1*$').hasMatch(cpf)) return false;

    // Cálculo do primeiro dígito verificador
    final List<int> digits = cpf.split('').map(int.parse).toList();
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += digits[i] * (10 - i);
    }
    int firstDigit = (sum * 10) % 11;
    if (firstDigit == 10) firstDigit = 0;

    // Cálculo do segundo dígito verificador
    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += digits[i] * (11 - i);
    }
    int secondDigit = (sum * 10) % 11;
    if (secondDigit == 10) secondDigit = 0;

    // Verifica se os dígitos verificadores estão corretos
    return firstDigit == digits[9] && secondDigit == digits[10];
  }

  static void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

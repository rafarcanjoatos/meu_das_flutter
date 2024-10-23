import 'package:flutter/material.dart';

mixin SnackbarUtils {
  static void showErrorMessage(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

import 'package:flutter/material.dart';

abstract class NavigatorUtils {
  static void navigatorScreen(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return page;
        },
      ),
    );
    return;
  }
}

import 'package:flutter/material.dart';

class MessageDialog {
  static void show(
      BuildContext context, String message, String title, String buttonText) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(buttonText),
                ),
              ],
            ));
  }
}

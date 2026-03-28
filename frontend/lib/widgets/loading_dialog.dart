import 'package:flutter/material.dart';

class LoadingDialog {
  static void show(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => Dialog(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Expanded(child: Text(message)),
                ],
              ),
            ),
          ),
    );
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }
}

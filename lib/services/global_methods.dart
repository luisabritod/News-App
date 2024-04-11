import 'package:bookmark/services/services.dart';
import 'package:bookmark/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class GlobalMethods {
  static Future<void> errorDialog({
    required String errorMessage,
    required BuildContext context,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: Utils(context).getBackgroundColor,
          content: Text(errorMessage),
          title: Row(
            children: [
              Icon(
                IconlyBold.danger,
                color: Utils(context).getButtonColor,
              ),
              const HorizontalSpacing(8),
              const Text('An error occured'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text('OK',
                  style: TextStyle(color: Utils(context).getButtonColor)),
            ),
          ],
        );
      },
    );
  }
}

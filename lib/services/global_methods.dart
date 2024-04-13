import 'package:bookmark/services/services.dart';
import 'package:bookmark/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';

class GlobalMethods {
  static String formattedDateText(String publishedAt) {
    final parsedData = DateTime.parse(publishedAt);
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm:ss').format(parsedData);
    DateTime publishedDate =
        DateFormat('yyyy-MM-dd hh:mm:ss').parse(formattedDate);

    return "${publishedDate.day}/${publishedDate.month}/${publishedDate.year} - ${publishedDate.hour}:${publishedDate.minute}";
  }

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

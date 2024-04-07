// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PaginationButtonWidget extends StatelessWidget {
  const PaginationButtonWidget({
    Key? key,
    required this.buttonColor,
    required this.label,
    required this.function,
    required this.textButtonColor,
  }) : super(key: key);

  final Color buttonColor;
  final String label;
  final Function function;
  final Color textButtonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: textButtonColor,
        padding: const EdgeInsets.all(6),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(
        label,
      ),
    );
  }
}

import 'package:bookmark/provider/provider.dart';
import 'package:bookmark/services/services.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.themeState,
    required this.label,
    required this.function,
    required this.icon,
  });

  final DarkThemeProvider themeState;
  final String label;
  final Function function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: 20,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        function();
      },
    );
  }
}

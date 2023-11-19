import 'package:flutter/material.dart';

showSnack(BuildContext context, Color color, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: color,
    ),
  );
}

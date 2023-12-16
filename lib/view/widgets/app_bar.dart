import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          )),
      centerTitle: true,
    );
  }
}

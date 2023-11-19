import 'package:flutter/material.dart';

class SectionHead extends StatelessWidget {
  const SectionHead({super.key, required this.heading});

  final String heading;
  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

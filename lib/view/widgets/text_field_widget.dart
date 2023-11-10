import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.userController,
    required this.label,
    required this.inputType,
    required this.obscureText,
    required this.validator,
  });

  final TextEditingController userController;
  final String label;
  final TextInputType inputType;
  final bool obscureText;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userController,
      obscureText: obscureText,
      keyboardType: inputType,
      validator: validator,
      decoration: InputDecoration(
        label: Text(label),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

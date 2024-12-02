import 'package:flutter/material.dart';
import 'package:gdg_hackathon/core/functions/input_border.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      required this.controller,
      required this.validator,
      this.isObscure = false});
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isObscure,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),
    );
  }
}

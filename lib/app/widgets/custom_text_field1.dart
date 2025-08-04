import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.onChange,
    required this.hintText,
    this.obscureText,
    this.textInputType,
  });
  Function(String)? onChange;
  String? hintText;
  bool? obscureText;
  TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      // obscureText: obscureText == null ? false : true,
      obscureText: obscureText!,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: onChange,
    );
  }
}

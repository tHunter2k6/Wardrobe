import 'package:flutter/material.dart';

class TextfieldsInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextfieldsInput(
      {required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType,
      super.key});

  @override
  Widget build(BuildContext context) {
    final InputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        fillColor: Colors.grey[50],
        hintText: hintText,
        border: InputBorder,
        focusedBorder: InputBorder,
        enabledBorder: InputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}

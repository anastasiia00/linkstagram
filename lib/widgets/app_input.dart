// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    this.hintText,
    this.textInputType,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final bool isPass;
  final String? hintText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: Divider.createBorderSide(context),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: Divider.createBorderSide(context),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: Divider.createBorderSide(context),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(14),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}

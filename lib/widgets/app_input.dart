// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    Key? key,
    this.textEditingController,
    this.isPass = false,
    this.hintText,
    this.textInputType,
    this.onChange,
    this.validator,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final String? Function(String?)?
      validator; // VALIDATOR https://docs.flutter.dev/cookbook/forms/validation
  final bool isPass;
  final String? hintText;
  final TextInputType? textInputType;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator:
          validator, // VALIDATOR https://docs.flutter.dev/cookbook/forms/validation
      onChanged: onChange != null
          ? (value) {
              onChange!(value);
            }
          : null,
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

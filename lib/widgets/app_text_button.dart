// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// onPressed => OBRSDHRNIE = IA FUNCTION
// onPressed() => VIZOV = VIZOVET TO CHTO ONO DELAET

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    this.onPressed,
    required this.title,
    this.buttonColor,
    this.isBorder = false,
  }) : super(key: key);

  final Function? onPressed;
  final String title;
  final Color? buttonColor;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor != null ? buttonColor! : Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onPressed != null
            ? () {
                onPressed!();
              }
            : null,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: !isBorder
                ? Border.all(
                    width: 1,
                    color: Colors.transparent,
                  )
                : Border.all(
                    width: 1,
                    color: const Color(0xff808080),
                  ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 14,
              bottom: 14,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: buttonColor != null ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

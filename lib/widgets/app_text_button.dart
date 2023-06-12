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
  }) : super(key: key);

  final Function? onPressed;
  final String title;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: InkWell(
        onTap: onPressed != null
            ? () {
                onPressed!();
              }
            : null,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: buttonColor != null ? buttonColor! : Colors.white,
            border: buttonColor != null
                ? Border.all(
                    width: 1,
                    color: Colors.transparent,
                  )
                : Border.all(
                    width: 1,
                    color: Color(0xff808080),
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

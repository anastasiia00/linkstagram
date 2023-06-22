import 'package:flutter/material.dart';
import 'package:linkstagram/widgets/app_input.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(),
      bottomSheet: AppInput(
        hintText: 'Enter message',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:linkstagram/ui_kit.dart';
import 'package:linkstagram/widgets/app_bar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UiKit(),
      backgroundColor: Color(0xffE5E5E5),
    );
  }
}

// ignore_for_file: unused_local_variable, unused_element

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/responsive/responsive_layout_screen.dart';
import 'package:linkstagram/screen/sign_up/layouts/sign_up_mobile_layout.dart';
import 'package:linkstagram/screen/sign_up/layouts/sign_up_web_layout.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      webScreenLayout: SignUpWebLayout(),
      mobileScreenLayout: SignUpMobileLayout(),
    );
  }
}

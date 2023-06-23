import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/responsive/responsive_layout_screen.dart';
import 'package:linkstagram/screen/home/layouts/mobile.dart';
import 'package:linkstagram/screen/home/layouts/web.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      webScreenLayout: ProfileWebLayout(),
      mobileScreenLayout: ProfileMobileLayout(),
    );
  }
}

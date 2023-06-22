import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/responsive/responsive_layout_screen.dart';
import 'package:linkstagram/screen/profile/layouts/mobile.dart';
import 'package:linkstagram/screen/profile/layouts/web.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      webScreenLayout: ProfileWebLayout(),
      mobileScreenLayout: ProfileMobileLayout(),
    );
  }
}

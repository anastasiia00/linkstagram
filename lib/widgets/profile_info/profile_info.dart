import 'package:flutter/material.dart';
import 'package:linkstagram/responsive/responsive_layout_screen.dart';
import 'package:linkstagram/widgets/profile_info/layouts/mobile.dart';
import 'package:linkstagram/widgets/profile_info/layouts/web.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreenLayout: ProfileInfoMobileLayout(),
      webScreenLayout: ProfileInfoWebLayout(),
    );
  }
}

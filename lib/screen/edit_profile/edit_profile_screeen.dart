import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/responsive/responsive_layout_screen.dart';
import 'package:linkstagram/screen/edit_profile/layouts/mobile.dart';
import 'package:linkstagram/screen/edit_profile/layouts/web.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      webScreenLayout: EditProfileWebLayout(),
      mobileScreenLayout: EditProfileMobileLayout(),
    );
  }
}

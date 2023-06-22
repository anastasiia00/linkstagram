// ignore_for_file: use_key_in_widget_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/responsive/responsive_layout_screen.dart';

part 'layouts/mobile.dart';
part 'layouts/web.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.isProfile,
  });

  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      webScreenLayout: _Web(),
      mobileScreenLayout: _Mobile(
        isProfile: isProfile,
      ),
    );
  }
}

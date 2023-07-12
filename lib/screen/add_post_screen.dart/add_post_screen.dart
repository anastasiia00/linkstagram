import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/responsive/responsive_layout_screen.dart';
import 'package:linkstagram/screen/add_post_screen.dart/layouts/mobile.dart';
import 'package:linkstagram/screen/add_post_screen.dart/layouts/web.dart';

@RoutePage()
class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      webScreenLayout: AddPostWebLayout(),
      mobileScreenLayout: AddPostMobileLayout(),
    );
  }
}
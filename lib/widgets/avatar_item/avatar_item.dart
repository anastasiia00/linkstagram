// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:linkstagram/responsive/responsive_layout_screen.dart';
import 'package:linkstagram/widgets/avatar_item/layouts/mobile.dart';
import 'package:linkstagram/widgets/avatar_item/layouts/web.dart';

class AvatarItem extends StatelessWidget {
  const AvatarItem({
    Key? key,
    required this.image,
    required this.size,
    this.isProfilePicture = false,
  }) : super(key: key);

  final String image;
  final double size;
  final bool isProfilePicture;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      webScreenLayout: AvatarItemWebLayout(
        image: image,
        size: size,
        isProfilePicture: isProfilePicture,
      ),
      mobileScreenLayout: AvatarItemMobileLayout(
        image: image,
        size: size,
      ),
    );
  }
}

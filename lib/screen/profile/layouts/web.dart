import 'package:flutter/material.dart';
import 'package:linkstagram/widgets/app_bar/app_bar.dart';

class ProfileWebLayout extends StatelessWidget {
  const ProfileWebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          isProfile: true,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:linkstagram/widgets/app_bar/app_bar.dart';
import 'package:linkstagram/widgets/post_grid.dart';
import 'package:linkstagram/widgets/profile_info/profile_info.dart';

class ProfileMobileLayout extends StatelessWidget {
  const ProfileMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          isProfile: true,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 32,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            ProfileInfo(),
            SizedBox(
              height: 32,
            ),
            Expanded(
              child: PostGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

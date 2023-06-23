import 'package:flutter/material.dart';
import 'package:linkstagram/widgets/app_bar/app_bar.dart';
import 'package:linkstagram/widgets/post.dart';
import 'package:linkstagram/widgets/story.dart';

class ProfileMobileLayout extends StatelessWidget {
  const ProfileMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          isProfile: false,
        ),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.only(
              top: 24,
            ),
            child: Column(
              children: [
                Story(
                  size: 64,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Post(
                    name: 'Nettie Fernandez',
                    time: 'Just now',
                    avatarProfile:
                        'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
                    postPhotos: [
                      'https://newprofilepic2.photo-cdn.net//assets/images/article/selfie-ideas.jpg',
                      'https://woody.cloudly.space/app/uploads/montpelliertourisme/2022/12/thumbs/Pic-Saint-Loup-Montpellier-Wine-Tour-excursion-1920x960.jpg',
                    ],
                    description:
                        'TB to New York October 2018. "You shouldn\'t wait for other people to make special things happen. You have to create your own memories." Heidi Klum',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

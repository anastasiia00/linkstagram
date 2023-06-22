import 'package:flutter/material.dart';
import 'package:linkstagram/widgets/app_bar/app_bar.dart';
import 'package:linkstagram/widgets/post.dart';
import 'package:linkstagram/widgets/profile_info/layouts/web.dart';
import 'package:linkstagram/widgets/story.dart';

class ProfileWebLayout extends StatelessWidget {
  const ProfileWebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          isProfile: false,
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: 560,
                child: Padding(
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
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 32,
            ),
            child: ProfileInfoWebLayout(),
          ),
        ],
      ),
    );
  }
}

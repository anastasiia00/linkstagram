// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:linkstagram/widgets/account_info.dart';
import 'package:linkstagram/widgets/app_text_button.dart';
import 'package:linkstagram/widgets/avatar_item/avatar_item.dart';
import 'package:linkstagram/widgets/follow_info.dart';

class ProfileInfoWebLayout extends StatelessWidget {
  const ProfileInfoWebLayout({
    Key? key,
    required this.name,
    required this.username,
    required this.followers,
    required this.following,
    this.avatar,
  }) : super(key: key);

  final String name;
  final String username;
  final List followers;
  final List following;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FollowInfo(
                count: followers.length,
                followInfo: 'Followers',
              ),
              SizedBox(
                width: 20,
              ),
              AvatarItem(
                image: avatar.toString(),
                // 'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
                size: 88,
                isProfilePicture: true,
              ),
              SizedBox(
                width: 20,
              ),
              FollowInfo(
                count: following.length,
                followInfo: 'Following',
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          AccountInfoWidget(
            name: name,
            profession: 'Photographer',
            description:
                'Like to travel and shoot cinematic and b/w photos Tools - Capture One for Raw',
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: AppTextButton(
                  onPressed: () {
                    context.router.pushNamed('/editProfile');
                  },
                  title: 'Edit profile',
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 1,
                child: AppTextButton(
                  onPressed: () {
                    context.router.pushNamed('/addPost');
                  },
                  title: 'New post',
                  buttonColor: Color(0xff0087FF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

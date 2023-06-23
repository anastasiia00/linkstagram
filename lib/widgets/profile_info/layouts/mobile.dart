import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/widgets/account_info.dart';
import 'package:linkstagram/widgets/app_text_button.dart';
import 'package:linkstagram/widgets/avatar_item/avatar_item.dart';
import 'package:linkstagram/widgets/follow_info.dart';

class ProfileInfoMobileLayout extends StatelessWidget {
  const ProfileInfoMobileLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 400,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FollowInfo(
                count: 1200,
                followInfo: 'Followers',
              ),
              SizedBox(
                width: 20,
              ),
              AvatarItem(
                image:
                    'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
                size: 88,
              ),
              SizedBox(
                width: 20,
              ),
              FollowInfo(
                count: 156,
                followInfo: 'Following',
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          AccountInfoWidget(
            name: 'Alexandr Sokolov',
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
                  title: 'Edit profile',
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 1,
                child: AppTextButton(
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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/widgets/app_bar/app_bar.dart';
import 'package:linkstagram/widgets/app_input.dart';
import 'package:linkstagram/widgets/app_text_button.dart';

class EditProfileMobileLayout extends StatelessWidget {
  const EditProfileMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          isProfile: true,
        ),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.only(
              top: 32,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                AppInput(
                  title: 'Nickname',
                  hintText: 'Nickname ...',
                ),
                SizedBox(
                  height: 32,
                ),
                AppInput(
                  title: 'First Name',
                  hintText: 'First Name ...',
                ),
                SizedBox(
                  height: 32,
                ),
                AppInput(
                  title: 'Second Name',
                  hintText: 'Second Name ...',
                ),
                SizedBox(
                  height: 32,
                ),
                AppInput(
                  title: 'Job Title',
                  hintText: 'Job Title ...',
                ),
                SizedBox(
                  height: 32,
                ),
                AppInput(
                  maxLines: 3,
                  title: 'Description',
                  hintText: 'Description ...',
                ),
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Container(
          height: 120,
          child: Column(
            children: [
              AppTextButton(
                onPressed: () {},
                title: 'Save',
                buttonColor: Color(0xff0087FF),
              ),
              const SizedBox(
                height: 8,
              ),
              AppTextButton(
                onPressed: () {
                  context.router.pop();
                },
                title: 'Cancel',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

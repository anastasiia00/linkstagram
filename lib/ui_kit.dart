import 'package:flutter/material.dart';
import 'package:linkstagram/screen/auth_view.dart';
import 'package:linkstagram/screen/sign_up.view.dart';
import 'package:linkstagram/widgets/account_info.dart';
import 'package:linkstagram/widgets/app_bar.dart';
import 'package:linkstagram/widgets/app_text_button.dart';

class UiKit extends StatelessWidget {
  const UiKit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ui Kit',
        ),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: const Text('Widgets'),
            children: [
              PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: AppBarWidget(
                  isProfile: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const AccountInfoWidget(
                name: 'Alexandr Sokolov',
                profession: 'Photographer',
                description:
                    'Like to travel and shoot cinematic and b/w photos Tools - Capture One for Raw',
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ExpansionTile(
            title: const Text('Screens'),
            children: [
              AppTextButton(
                title: 'Login Screen',
                onPressed: () {
                  print("12342423");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextButton(
                title: 'SignUp Screen',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

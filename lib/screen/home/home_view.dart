import 'package:flutter/material.dart';
import 'package:linkstagram/widgets/app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(
          isProfile: false,
        ),
      ),
      body: Center(
        child: Text('HOME VIEW'),
      ),
    );
  }
}

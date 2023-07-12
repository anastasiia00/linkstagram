import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/widgets/app_bar/app_bar.dart';
import 'package:linkstagram/widgets/post_grid.dart';
import 'package:linkstagram/widgets/profile_info/profile_info.dart';

class ProfileWebLayout extends StatefulWidget {
  const ProfileWebLayout({super.key});

  @override
  State<ProfileWebLayout> createState() => _ProfileWebLayoutState();
}

class _ProfileWebLayoutState extends State<ProfileWebLayout> {
  String name = '';
  @override
  void initState() {
    super.initState();
    getName();
  }

  void getName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    print(snap.data());

    setState(() {
      name = (snap.data() as Map<String, dynamic>)['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
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
            ProfileInfo(
              name: name,
            ),
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

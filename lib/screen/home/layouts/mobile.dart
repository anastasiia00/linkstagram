import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/services/firestore_methods.dart';
import 'package:linkstagram/utils/helper.dart';
import 'package:linkstagram/widgets/app_bar/app_bar.dart';
import 'package:linkstagram/widgets/post.dart';
import 'package:linkstagram/widgets/story.dart';

class HomeMobileLayout extends StatefulWidget {
  const HomeMobileLayout({super.key});

  @override
  State<HomeMobileLayout> createState() => _HomeMobileLayoutState();
}

class _HomeMobileLayoutState extends State<HomeMobileLayout> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

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
                  child: PostWidget(
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

  void postImage(String uid, String username, String profImage) async {
    setState(() {
      isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        if (context.mounted) {
          showSnackBar(
            context,
            'Posted!',
          );
        }
        clearImage();
      } else {
        if (context.mounted) {
          showSnackBar(context, res);
        }
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }
}

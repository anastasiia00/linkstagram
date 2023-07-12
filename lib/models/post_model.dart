import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String name;
  final String uid;
  final DateTime? time;
  final String avatarProfile;
  final String description;
  final String? postPhoto;
  // final List<String> postPhotos;
  final int? likesCount;
  final int? commentsCount;

  const Post({
    required this.name,
    required this.uid,
    this.time,
    required this.avatarProfile,
    required this.description,
    this.postPhoto,
    this.likesCount,
    this.commentsCount,
  });

  factory Post.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      name: snapshot["name"],
      uid: snapshot["uid"],
      avatarProfile: snapshot["avatarProfile"],
      description: snapshot["description"],
      postPhoto: snapshot["postPhoto"],
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "likesCount": likesCount,
        "name": name,
        "time": time,
      };
}

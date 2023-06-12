import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linkstagram/services/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> signUp({
    required String email,
    required String password,
    required String name,
    required String username,
    required Uint8List file,
  }) async {
    String result = "[AuthMethods ERROR] ---- signUp";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty ||
          username.isNotEmpty ||
          file != null) {
        UserCredential userData = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String avatar =
            await StorageMethods().uploadImageToStorage('avatar', file, false);
        print(userData.user);
        await _firebaseFirestore
            .collection('users')
            .doc(userData.user!.uid)
            .set({
          'email': email,
          'name': name,
          'uid': userData.user!.uid,
          'username': username,
          'followers': [],
          'following': [],
          'avatar': avatar,
        });

        // await _firebaseFirestore.c
        return result = "success";
      }
    } catch (error) {
      return result = error.toString();
    }
    return result;
  }
}

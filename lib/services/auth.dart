import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:linkstagram/models/app_response.dart';
import 'package:linkstagram/services/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<AppResponse> signUp({
    required String email,
    required String password,
    required String name,
    required String username,
    Uint8List? file,
  }) async {
    debugPrint("signUp AuthMethods");
    try {
      UserCredential userData = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      String? avatar;

      if (file != null) {
        avatar =
            await StorageMethods().uploadImageToStorage('avatar', file, false);
      }

      await _firebaseFirestore.collection('users').doc(userData.user!.uid).set({
        'email': email,
        'name': name,
        'uid': userData.user!.uid,
        'username': username,
        'followers': [],
        'following': [],
        'avatar': avatar,
      });

      return AppResponse(
        success: true,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return AppResponse(
          success: false,
          errors: 'wrong email',
        );
      }
      return AppResponse(
        success: false,
        errors: e.code,
      );
    } catch (error) {
      return AppResponse(
        success: false,
        errors: error.toString(),
      );
    }
  }

  Future<AppResponse> loginUser({
    required String email,
    required String password,
  }) async {
    debugPrint("loginUser AuthMethods");
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        AppResponse(success: true);
      } else {
        AppResponse(
          success: false,
          errors: 'enter information in fields',
        );
      }
    } catch (error) {
      AppResponse(success: false, errors: error.toString());
    }
    return AppResponse(
      success: true,
    );
  }
}

// ignore_for_file: unnecessary_import, avoid_print

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:linkstagram/models/app_response.dart';
import 'package:linkstagram/services/storage_methods.dart';
import 'package:linkstagram/models/user_model.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firebaseFirestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

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
        email: email,
        password: password,
      );

      print(email);
      print(password);
      print(userData);

      String? avatar;

      if (file != null) {
        avatar =
            await StorageMethods().uploadImageToStorage('avatar', file, false);
      }

      model.User user = model.User(
        uid: userData.user!.uid,
        email: email,
        password: password,
        name: name,
        avatar: avatar ?? '',
        username: username,
        followers: [],
        following: [],
      );

      await _firebaseFirestore
          .collection('users')
          .doc(userData.user!.uid)
          .set(user.toJson());

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

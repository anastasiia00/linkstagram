// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/models/app_response.dart';
import 'package:linkstagram/services/auth.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpStateInitial());

  final AuthMethods service = AuthMethods();

  void avatarUpdate(String avatarPath) {
    print('avatarUpdate SignUpCubit');
    emit(SignUpStateUpdated(
      avatarPath: avatarPath,
    ));
  }

  Future<void> signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String username,
  }) async {
    String? avatarPath;
    if (state is SignUpStateUpdated) {
      avatarPath = (state as SignUpStateUpdated).avatarPath;
    }
    emit(SignUpStateProcessing());
    Uint8List? avatar;
    if (avatarPath != null) {
      avatar = await File(avatarPath).readAsBytes();
    }
    final AppResponse result = await service.signUp(
      email: email,
      password: password,
      name: name,
      username: username,
      file: avatar,
    );
    if (result.success == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          //---- red color
          content: Text(result.errors!),
        ),
      );
    }
    if (result.success) {
      context.router.pushNamed('/home');
      return;
    }
    emit(
      SignUpStateUpdated(
        avatarPath: avatarPath,
      ),
    );
  }
}

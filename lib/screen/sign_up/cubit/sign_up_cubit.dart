import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkstagram/models/app_response.dart';
import 'package:linkstagram/screen/home/home_view.dart';
import 'package:linkstagram/services/auth.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  final AuthMethods service = AuthMethods();

  void nameUpdate(String name) {
    print('nameUpdate SignUpCubit');
    emit(
      state.copyWith(
        name: name,
      ),
    );
  }

  void usernameUpdate(String username) {
    print('usernameUpdate SignUpCubit');
    emit(
      state.copyWith(
        username: username,
      ),
    );
  }

  void emailUpdate(String email) {
    print('emailUpdate SignUpCubit');

    emit(
      state.copyWith(
        email: email,
      ),
    );
  }

  void passwordUpdate(String password) {
    print('passwordUpdate SignUpCubit');
    emit(
      state.copyWith(
        password: password,
      ),
    );
  }

  void avatarUpdate(String avatarPath) {
    print('avatarUpdate SignUpCubit');
    emit(
      state.copyWith(
        avatarPath: avatarPath,
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    Uint8List? avatar;
    if (state.avatarPath != null) {
      avatar = await File(state.avatarPath!).readAsBytes();
    }
    final AppResponse result = await service.signUp(
      email: state.email,
      password: state.password,
      name: state.name,
      username: state.username,
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
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
        (Route<dynamic> route) => false,
      );
    }
    emit(state.copyWith(isLoading: false));
  }
}

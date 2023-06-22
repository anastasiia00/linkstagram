// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/models/app_response.dart';
import 'package:linkstagram/services/auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthStateInitial());

  final AuthMethods service = AuthMethods();

  Future<void> logIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    emit(AuthStateProcessing());
    final AppResponse result = await service.loginUser(
      email: email,
      password: password,
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
    emit(AuthStateProcessing());
  }
}

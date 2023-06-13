import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:linkstagram/models/app_response.dart';
import 'package:linkstagram/screen/home/home_view.dart';
import 'package:linkstagram/services/auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  final AuthMethods service = AuthMethods();

  void emailUpdate(String email) {
    print('emailUpdate AuthCubit');

    emit(
      state.copyWith(
        email: email,
      ),
    );
  }

  void passwordUpdate(String password) {
    print('passwordUpdate AuthCubit');
    emit(
      state.copyWith(
        password: password,
      ),
    );
  }

  Future<void> logIn(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final AppResponse result = await service.loginUser(
      email: state.email,
      password: state.password,
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

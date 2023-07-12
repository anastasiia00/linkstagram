import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkstagram/models/user_model.dart';
import 'package:linkstagram/services/auth.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  final AuthMethods _authMethods = AuthMethods();

  Future<void> init({Function(bool)? onDone}) async {
    auth.User? user = auth.FirebaseAuth.instance.currentUser;

    if (user != null) {
      emit(AppLoading());
      await refreshuser();
      if (onDone != null) {
        onDone(true);
      }
    }
  }

  Future<void> refreshuser() async {
    User user = await _authMethods.getUserDetails();
    emit(
      AppLogedIn(user: user),
    );
  }
}

part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.email,
    this.password,
  });

  final String? email;
  final String? password;

  @override
  List<Object> get props => [];
}

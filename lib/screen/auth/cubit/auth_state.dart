// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
  });

  final String email;
  final String password;
  final bool isLoading;

  @override
  List<Object?> get props => [
        email,
        password,
        isLoading,
      ];

  AuthState copyWith({
    String? email,
    String? password,
    bool? isLoading,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

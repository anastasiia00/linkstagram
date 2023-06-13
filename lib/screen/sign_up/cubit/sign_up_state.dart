// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.email = '',
    this.password = '',
    this.username = '',
    this.name = '',
    this.avatarPath,
    this.isLoading = false,
  });

  final String email;
  final String password;
  final String username;
  final String name;
  final String? avatarPath;
  final bool isLoading;

  @override
  List<Object?> get props => [
        email,
        password,
        username,
        name,
        avatarPath,
        isLoading,
      ];

  SignUpState copyWith({
    String? email,
    String? password,
    String? username,
    String? name,
    String? avatarPath,
    bool? isLoading,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      name: name ?? this.name,
      avatarPath: avatarPath ?? this.avatarPath,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {}

class SignUpStateInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpStateProcessing extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpStateSuccess extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpStateUpdated extends SignUpState {
  SignUpStateUpdated({
    this.avatarPath,
  });

  final String? avatarPath;

  @override
  List<Object?> get props => [
        avatarPath,
      ];
}

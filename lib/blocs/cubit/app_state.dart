part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();
  User? get user;

  @override
  List<dynamic> get props => [user];
}

class AppInitial extends AppState {
  @override
  User? get user => null;
}

class AppLoading extends AppState {
  @override
  User? get user => null;
}

class AppLogedIn extends AppState {
  @override
  final User user;

  const AppLogedIn({required this.user});

  @override
  List<dynamic> get props => [user];
}

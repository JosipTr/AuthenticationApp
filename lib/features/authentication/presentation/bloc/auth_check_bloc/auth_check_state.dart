import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';

abstract class AuthCheckState extends Equatable {
  const AuthCheckState();

  @override
  List<Object?> get props => [];
}

class AuthCheckInitState extends AuthCheckState {
  const AuthCheckInitState();

  @override
  List<Object?> get props => [];
}

class UserLoggedInState extends AuthCheckState {
  final User user;

  const UserLoggedInState({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserNotLoggedInState extends AuthCheckState {
  const UserNotLoggedInState();

  @override
  List<Object?> get props => [];
}
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthenticationInitState extends AuthenticationState {
  const AuthenticationInitState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends AuthenticationState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class SuccessState extends AuthenticationState {
  const SuccessState();

  @override
  List<Object?> get props => [];
}

class FailureState extends AuthenticationState {
  const FailureState();
}


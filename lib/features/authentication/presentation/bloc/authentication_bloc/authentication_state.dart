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
  final String message;
  const SuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class FailureState extends AuthenticationState {
  final String message;
  const FailureState({required this.message});
  @override
  List<Object?> get props => [message];
}

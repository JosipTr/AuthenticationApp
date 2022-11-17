import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class RegisterEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const RegisterEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LogoutEvent extends AuthenticationEvent {
  const LogoutEvent();
}

class SendResetPasswordEvent extends AuthenticationEvent {
  final String email;

  const SendResetPasswordEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class ConfirmPasswordResetEvent extends AuthenticationEvent {
  final String code;
  final String newPassword;

  const ConfirmPasswordResetEvent({required this.code, required this.newPassword});

  @override
  List<Object?> get props => [code, newPassword];
}
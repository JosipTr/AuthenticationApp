// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/features/authentication/domain/usecases/confirm_password_reset.dart';
import 'package:login_app/features/authentication/domain/usecases/login.dart';
import 'package:login_app/features/authentication/domain/usecases/logout.dart';
import 'package:login_app/features/authentication/domain/usecases/register.dart';
import 'package:login_app/features/authentication/presentation/bloc/authentication_bloc/authentication_event.dart';
import 'package:login_app/features/authentication/presentation/bloc/authentication_bloc/authentication_state.dart';

import '../../../domain/usecases/reset_password.dart';

const String LOGIN_SUCCESS_MESSAGE = "You have successfully logged in";
const String REGISTER_SUCCESS_MESSAGE = "You have successfully registered";
const String LOGOUT_SUCCESS_MESSAGE = "You have successfully logged out";
const String SEND_PASSWORD_RESET_EMAIL_SUCCESS_MESSAGE = "Password reset e-mail successfully sent";
const String PASSWORD_RESET_SUCCESS = "You have successfully changed your password";

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Login login;
  final Logout logout;
  final Register register;
  final SendResetPasswordEmail sendResetPasswordEmail;
  final ConfirmPasswordReset confirmPasswordReset;

  AuthenticationBloc({required this.login, required this.logout, required this.register, required this.sendResetPasswordEmail, required this.confirmPasswordReset}) : super(const AuthenticationInitState()) {
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<SendResetPasswordEvent>(_onSendResetPasswordEmailEvent);
    on<ConfirmPasswordResetEvent>(_onConfirmPasswordResetEvent);
  }

  void _onLoginEvent(LoginEvent event, Emitter<AuthenticationState> emit) async{
    emit(const LoadingState());
    var either = await login.call(event.email, event.password);
    either.fold((failure) => emit(FailureState(message: failure.message)), (r) => emit(const SuccessState(message: LOGIN_SUCCESS_MESSAGE)));
  }

  void _onRegisterEvent(RegisterEvent event, Emitter<AuthenticationState> emit) async{
    emit(const LoadingState());
    var either = await register.call(event.email, event.password);
    either.fold((failure) => emit(FailureState(message: failure.message)), (r) => emit(const SuccessState(message: REGISTER_SUCCESS_MESSAGE)));
  }

  void _onLogoutEvent(LogoutEvent event, Emitter<AuthenticationState> emit) async{
    emit(const LoadingState());
    var either = await logout.call();
    either.fold((failure) => emit(FailureState(message: failure.message)), (r) => emit(const SuccessState(message: REGISTER_SUCCESS_MESSAGE)));
  }

  void _onSendResetPasswordEmailEvent(SendResetPasswordEvent event, Emitter<AuthenticationState> emit) async{
    emit(const LoadingState());
    var either = await sendResetPasswordEmail.call(event.email);
    either.fold((failure) => emit(FailureState(message: failure.message)), (r) => emit(const SuccessState(message: SEND_PASSWORD_RESET_EMAIL_SUCCESS_MESSAGE)));
  }

  void _onConfirmPasswordResetEvent(ConfirmPasswordResetEvent event, Emitter<AuthenticationState> emit) async{
    emit(const LoadingState());
    var either = await confirmPasswordReset.call(event.code, event.newPassword);
    either.fold((failure) => emit(FailureState(message: failure.message)), (r) => emit(const SuccessState(message: PASSWORD_RESET_SUCCESS)));
  }
}
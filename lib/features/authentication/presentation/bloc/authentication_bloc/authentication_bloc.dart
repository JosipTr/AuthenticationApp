// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/features/authentication/domain/usecases/login.dart';
import 'package:login_app/features/authentication/domain/usecases/logout.dart';
import 'package:login_app/features/authentication/domain/usecases/register.dart';
import 'package:login_app/features/authentication/presentation/bloc/authentication_bloc/authentication_event.dart';
import 'package:login_app/features/authentication/presentation/bloc/authentication_bloc/authentication_state.dart';

import '../../../domain/usecases/reset_password.dart';

const String LOGIN_SUCCESS_MESSAGE = "You have successfully logged in";
const String REGISTER_SUCCESS_MESSAGE = "You have successfully registered";
const String LOGOUT_SUCCESS_MESSAGE = "You have successfully logged out";
const String PASSWORD_RESET_SUCCESS_MESSAGE = "Password reset e-mail successfully sent";

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Login login;
  final Logout logout;
  final Register register;
  final SendResetPasswordEmail sendResetPasswordEmail;

  AuthenticationBloc({required this.login, required this.logout, required this.register, required this.sendResetPasswordEmail}) : super(const AuthenticationInitState()) {
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<ResetPasswordEvent>(_onResetPasswordEvent);
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

  void _onResetPasswordEvent(ResetPasswordEvent event, Emitter<AuthenticationState> emit) async{
    emit(const LoadingState());
    var either = await sendResetPasswordEmail.call(event.email);
    either.fold((failure) => emit(FailureState(message: failure.message)), (r) => emit(const SuccessState(message: PASSWORD_RESET_SUCCESS_MESSAGE)));
  }
}
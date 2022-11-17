import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/features/authentication/domain/usecases/auth_state_changes.dart';
import 'package:login_app/features/authentication/presentation/bloc/auth_check_bloc/auth_check_event.dart';
import 'package:login_app/features/authentication/presentation/bloc/auth_check_bloc/auth_check_state.dart';

class AuthCheckBloc extends Bloc<AuthCheckEvent, AuthCheckState> {
  final AuthStateChanges authStateChanges;

  AuthCheckBloc({required this.authStateChanges})
      : super(const AuthCheckInitState()) {
    on<ApplicationStartedEvent>(_onAppStarted);
    on<AuthStateChangesEvent>(_onAuthStateChanges);
  }

  void _onAppStarted(
      ApplicationStartedEvent event, Emitter<AuthCheckState> emit) async {
    emit.onEach(authStateChanges.call(),
        onData: (user) => add(AuthStateChangesEvent(user: user)));
  }

  void _onAuthStateChanges(
      AuthStateChangesEvent event, Emitter<AuthCheckState> emit) async {
    if (event.user == null) {
      emit(const UserNotLoggedInState());
    } else {
      emit(UserLoggedInState(user: event.user!));
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:login_app/features/authentication/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:login_app/features/authentication/data/repositories/user_repository_impl.dart';
import 'package:login_app/features/authentication/domain/repositories/user_repository.dart';
import 'package:login_app/features/authentication/domain/usecases/auth_state_changes.dart';
import 'package:login_app/features/authentication/domain/usecases/confirm_password_reset.dart';
import 'package:login_app/features/authentication/domain/usecases/login.dart';
import 'package:login_app/features/authentication/domain/usecases/logout.dart';
import 'package:login_app/features/authentication/domain/usecases/register.dart';
import 'package:login_app/features/authentication/domain/usecases/reset_password.dart';
import 'package:login_app/features/authentication/presentation/bloc/auth_check_bloc/auth_check_bloc.dart';
import 'package:login_app/features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';

final di = GetIt.instance;

Future<void> initAuthDependencies() async{
  ///FirebaseAuth instance
  di.registerLazySingleton(() => FirebaseAuth.instance);

  ///Bloc
  di.registerFactory(() => AuthenticationBloc(login: di(), logout: di(), register: di(), sendResetPasswordEmail: di(), confirmPasswordReset: di()));
  di.registerFactory(() => AuthCheckBloc(authStateChanges: di()));

  ///Repository
  di.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDatasource: di()));

  ///RemoteDataSource
  di.registerLazySingleton<RemoteDatasource>(() => FirebaseRemoteDatasource(firebaseAuth: di()));

  ///Usecase
  di.registerLazySingleton(() => Login(repository: di()));
  di.registerLazySingleton(() => Register(repository: di()));
  di.registerLazySingleton(() => Logout(repository: di()));
  di.registerLazySingleton(() => SendResetPasswordEmail(repository: di()));
  di.registerLazySingleton(() => ConfirmPasswordReset(repository: di()));
  di.registerLazySingleton(() => AuthStateChanges(repository: di()));

}
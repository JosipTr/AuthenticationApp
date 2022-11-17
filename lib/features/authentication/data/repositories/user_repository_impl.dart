import 'package:login_app/core/errors/exceptions/exceptions.dart';
import 'package:login_app/features/authentication/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:login_app/features/authentication/domain/entities/user.dart';
import 'package:login_app/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:login_app/features/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDatasource remoteDatasource;

  const UserRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, User>> authStateChanges() async {
    try {
      final User user = await remoteDatasource.authStateChanges();
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      return Right(await remoteDatasource.login(email, password));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      return Right(await remoteDatasource.logout());
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> register(String email, String password) async {
    try {
      return Right(await remoteDatasource.register(email, password));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> sendResetPasswordEmail(String email) async {
    try {
      return Right(await remoteDatasource.resetPassword(email));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    }
  }
}
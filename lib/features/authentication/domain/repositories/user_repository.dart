import 'package:dartz/dartz.dart';
import 'package:login_app/features/authentication/domain/entities/user.dart';

import '../../../../core/errors/failures/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> register(String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> resetPassword(String email);
  Future<Either<Failure, User>> authStateChanges();
} 
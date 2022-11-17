import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> register(String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> resetPassword();
} 
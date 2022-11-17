import 'package:dartz/dartz.dart';
import 'package:login_app/features/authentication/domain/entities/user.dart';
import 'package:login_app/features/authentication/domain/repositories/user_repository.dart';

import '../../../../core/errors/failures/failure.dart';

class AuthStateChanges {
  final UserRepository repository;

  const AuthStateChanges({required this.repository});

  Future<Either<Failure, User>> call() async {
    return await repository.authStateChanges();
  }
}
import 'package:dartz/dartz.dart';
import 'package:login_app/features/authentication/domain/repositories/user_repository.dart';

import '../../../../core/errors/failures/failure.dart';

class Login {
  final UserRepository repository;

  const Login({required this.repository});

  Future<Either<Failure, void>> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
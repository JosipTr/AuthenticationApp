import 'package:dartz/dartz.dart';
import 'package:login_app/features/authentication/domain/repositories/user_repository.dart';

import '../../../../core/failures/failure.dart';

class Register {
  final UserRepository repository;

  const Register({required this.repository});
  Future<Either<Failure, void>> call(String email, String password) async {
    return await repository.register(email, password);
  }
}
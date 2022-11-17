import 'package:dartz/dartz.dart';
import 'package:login_app/features/authentication/domain/repositories/user_repository.dart';

import '../../../../core/errors/failures/failure.dart';

class ConfirmPasswordReset {
  final UserRepository repository;

  const ConfirmPasswordReset({required this.repository});

  Future<Either<Failure, void>> call(String code, String newPassword) async {
    return await repository.confirmPasswordReset(code, newPassword);
  }
}
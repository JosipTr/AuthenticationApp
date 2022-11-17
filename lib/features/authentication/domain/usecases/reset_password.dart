import 'package:dartz/dartz.dart';
import 'package:login_app/features/authentication/domain/repositories/user_repository.dart';

import '../../../../core/errors/failures/failure.dart';

class SendResetPasswordEmail {
  final UserRepository repository;

  const SendResetPasswordEmail({required this.repository});

  Future<Either<Failure, void>> call(String email) async {
    return await repository.sendResetPasswordEmail(email);
  }
}
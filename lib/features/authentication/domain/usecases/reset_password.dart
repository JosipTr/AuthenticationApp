import 'package:dartz/dartz.dart';
import 'package:login_app/features/authentication/domain/repositories/user_repository.dart';

import '../../../../core/failures/failure.dart';

class ResetPassord {
  final UserRepository repository;

  const ResetPassord({required this.repository});

  Future<Either<Failure, void>> call() async {
    return await repository.resetPassword();
  }
}
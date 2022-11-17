import 'package:dartz/dartz.dart';
import 'package:login_app/features/authentication/domain/repositories/user_repository.dart';

import '../../../../core/failures/failure.dart';

class Logout {
  final UserRepository repository;

  const Logout({required this.repository});

  Future<Either<Failure, void>> call() async {
    return await repository.logout();
  }
}
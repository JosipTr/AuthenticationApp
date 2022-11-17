import 'package:login_app/features/authentication/domain/entities/user.dart';
import 'package:login_app/features/authentication/domain/repositories/user_repository.dart';

class AuthStateChanges {
  final UserRepository repository;

  const AuthStateChanges({required this.repository});

  Stream<User?> call() {
    return repository.authStateChanges();
  }
}

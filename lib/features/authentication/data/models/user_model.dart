import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required super.uid, required super.email, required super.isEmailVerified});

  @override
  List<Object?> get props => [uid, email, isEmailVerified];
}
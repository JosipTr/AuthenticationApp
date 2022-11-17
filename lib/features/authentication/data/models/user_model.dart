import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required super.uid, required super.email});

  @override
  List<Object?> get props => [uid, email];
}
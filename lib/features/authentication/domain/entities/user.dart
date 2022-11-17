import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String uid;
  final String email;
  final bool isEmailVerified;

  const User({required this.uid, required this.email, required this.isEmailVerified});

  @override
  List<Object?> get props => [uid, email, isEmailVerified];
}
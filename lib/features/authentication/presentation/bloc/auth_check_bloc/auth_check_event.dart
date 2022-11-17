import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';

abstract class AuthCheckEvent extends Equatable {
  const AuthCheckEvent();
  @override
  List<Object?> get props => [];
}

class AuthStateChangesEvent extends AuthCheckEvent {
  final User? user;
  const AuthStateChangesEvent({required this.user});

  @override
  List<Object?> get props => [];
}

class ApplicationStartedEvent extends AuthCheckEvent {
  const ApplicationStartedEvent();

  @override
  List<Object?> get props => [];
}
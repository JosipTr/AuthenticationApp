import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/features/authentication/data/models/user_model.dart';

import '../../../../../core/errors/exceptions/exceptions.dart';

abstract class RemoteDatasource {
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
  Future<void> sendResetPasswordEmail(String email);
  Stream<UserModel?> authStateChanges();
  Future<void> confirmPasswordReset(String code, String newPassword);
}

class FirebaseRemoteDatasource implements RemoteDatasource {
  final FirebaseAuth firebaseAuth;

  const FirebaseRemoteDatasource({required this.firebaseAuth});

  @override
  Future<void> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message ?? "Message is null");
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message ?? "Message is null");
    }
  }

  @override
  Future<void> register(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          message: e.message ?? "CreateUserWithEmailAndPassword exception");
    }
  }

  @override
  Future<void> sendResetPasswordEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          message: e.message ?? "SendPasswordResetEmail exception");
    }
  }

  @override
  Stream<UserModel?> authStateChanges() {
    return firebaseAuth.authStateChanges().asyncMap((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      } else {
        return UserModel(
            uid: firebaseUser.uid,
            email: firebaseUser.email!,
            isEmailVerified: firebaseUser.emailVerified);
      }
    });
  }

  @override
  Future<void> confirmPasswordReset(String code, String newPassword) async {
    try {
      await firebaseAuth.confirmPasswordReset(
          code: code, newPassword: newPassword);
    } on FirebaseAuthException catch (e) {
      throw AuthException(
          message: e.message ?? "ConfirmPasswordReset exception");
    }
  }
}

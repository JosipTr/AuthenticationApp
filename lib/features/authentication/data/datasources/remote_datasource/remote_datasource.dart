import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/features/authentication/data/models/user_model.dart';

import '../../../../../core/errors/exceptions/exceptions.dart';

abstract class RemoteDatasource {
  Future<void> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
  Future<void> resetPassword(String email);
  Future<UserModel> authStateChanges();
}

class FirebaseRemoteDatasource extends RemoteDatasource {
  final FirebaseAuth firebaseAuth;

  FirebaseRemoteDatasource({required this.firebaseAuth});

  @override
  Future<void> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message ?? "Message is null");
    }
  }

  @override
  Future<void> logout() async{
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message ?? "Message is null");
    }
  }

  @override
  Future<void> register(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message ?? "CreateUserWithEmailAndPassword exception");
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message ?? "SendPasswordResetEmail exception");
    }
  }
  
  @override
  Future<UserModel> authStateChanges() async {
    try {
      String email;
      String uid;
      bool isEmailVerified;

      email = firebaseAuth.currentUser?.email ?? "E-mail is null";
      uid = firebaseAuth.currentUser?.uid ?? "UID is null";
      isEmailVerified = firebaseAuth.currentUser?.emailVerified ?? false;

      return UserModel(uid: uid, email: email, isEmailVerified: isEmailVerified);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message ?? "AuthStateChange exception");
    }
  }
}
import 'package:logger/logger.dart';

import './user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImpl extends UserService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> authenticate() async {
      return false;
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Logger().e('UserService - signUp', error: e.toString());
      throw Exception("Erro ao tentar realizar o cadastro");
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Logger().e('UserService - signIn', error: e.toString());
      throw Exception("Erro ao tentar realizar o login");
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      Logger().e('UserService - signOut', error: e.toString());
      throw Exception("Erro ao tentar sair da conta");
    }
  }
}

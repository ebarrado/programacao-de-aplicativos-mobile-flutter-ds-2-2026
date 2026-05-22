// lib/services/auth_service.dart

import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import 'firestore_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirestoreService _firestoreService = FirestoreService();

  User? get currentUser => _auth.currentUser;

  Future<String?> registrar({
    required String nome,
    required String email,
    required String senha,
    required String tipo,
    required String turma,
  }) async {
    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      final user = UserModel(
        uid: credential.user!.uid,
        nome: nome,
        email: email,
        tipo: tipo,
        turma: turma,
        pontos: 0,
        coletas: 0,
      );

      await _firestoreService.criarUsuario(user);

      return null;
    } on FirebaseAuthException catch (e) {
      return "FirebaseAuthException: ${e.code} - ${e.message}";
    } catch (e) {
      return "Erro geral: $e";
    }
  }

  Future<String?> login({
    required String email,
    required String senha,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      return "FirebaseAuthException: ${e.code} - ${e.message}";
    } catch (e) {
      return "Erro geral: $e";
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
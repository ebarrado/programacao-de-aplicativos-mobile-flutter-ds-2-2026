// lib/services/firestore_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> criarUsuario(UserModel user) async {
    await _firestore.collection('users').doc(user.uid).set(
          user.toMap(),
        );
  }

  Future<UserModel?> buscarUsuario(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();

    if (doc.exists) {
      return UserModel.fromMap(doc.data()!);
    }

    return null;
  }

  Future<void> registrarColeta({
    required String usuarioId,
    required String material,
    required double quantidade,
    required int pontos,
  }) async {
    await _firestore.collection('coletas').add({
      'usuarioId': usuarioId,
      'material': material,
      'quantidade': quantidade,
      'pontos': pontos,
      'data': Timestamp.now(),
    });

    await _firestore.collection('users').doc(usuarioId).update({
      'pontos': FieldValue.increment(pontos),
      'coletas': FieldValue.increment(1),
    });
  }

  Stream<QuerySnapshot> rankingTurmas() {
    return _firestore
        .collection('users')
        .orderBy('pontos', descending: true)
        .snapshots();
  }
}
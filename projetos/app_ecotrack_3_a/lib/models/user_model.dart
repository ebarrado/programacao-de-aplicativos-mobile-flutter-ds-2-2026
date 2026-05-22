// lib/models/user_model.dart

class UserModel {
  final String uid;
  final String nome;
  final String email;
  final String tipo;
  final String turma;
  final int pontos;
  final int coletas;

  UserModel({
    required this.uid,
    required this.nome,
    required this.email,
    required this.tipo,
    required this.turma,
    required this.pontos,
    required this.coletas,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      tipo: map['tipo'] ?? '',
      turma: map['turma'] ?? '',
      pontos: map['pontos'] ?? 0,
      coletas: map['coletas'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nome': nome,
      'email': email,
      'tipo': tipo,
      'turma': turma,
      'pontos': pontos,
      'coletas': coletas,
    };
  }
}
// lib/models/coleta_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class ColetaModel {
  final String id;
  final String usuarioId;
  final String material;
  final double quantidade;
  final int pontos;
  final Timestamp data;

  ColetaModel({
    required this.id,
    required this.usuarioId,
    required this.material,
    required this.quantidade,
    required this.pontos,
    required this.data,
  });

  factory ColetaModel.fromMap(Map<String, dynamic> map, String id) {
    return ColetaModel(
      id: id,
      usuarioId: map['usuarioId'] ?? '',
      material: map['material'] ?? '',
      quantidade: (map['quantidade'] ?? 0).toDouble(),
      pontos: map['pontos'] ?? 0,
      data: map['data'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'usuarioId': usuarioId,
      'material': material,
      'quantidade': quantidade,
      'pontos': pontos,
      'data': data,
    };
  }
}
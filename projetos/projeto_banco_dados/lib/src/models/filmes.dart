import 'package:flutter/material.dart';


class Filme{
  //final String id;
  final String titulo;
  final String genero;
  final int ano;
  final double nota;
  final String descricao;

  //construtor da classe
  Filme({
    required this.titulo,
    required this.genero,
    required this.ano,
    required this.nota,
    required this.descricao
  });

  Map<String, dynamic> topCreateMap(){
    return{
      'titulo': titulo,
      'genero': genero,
      'ano': ano,
      'nota': nota,
      'descricao': descricao,
      //'createdAt': FieldValue.serverTimestamp(),
      //'updateAt': FieldValue.serverTimestamp(),
    };
  }

  Map<String, dynamic> topUpdateMap(){
    return{
      'titulo': titulo,
      'genero': genero,
      'ano': ano,
      'nota': nota,
      'descricao': descricao,
      //'updateAt': FielValue.serverTime
    };
  }
  factory Filme.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc){
    
  }
  
  
  

}
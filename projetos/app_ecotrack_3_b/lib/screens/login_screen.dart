import 'package:flutter/material.dart';

//ATALHO PARA CRIAR A CLASSE STATEFULLWIDGET
//stl

class LoginScreeen extends StatefulWidget {
  const LoginScreeen({super.key});

  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {

  //criação das variaveis
  final TextEditingController userController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Tela de Login EcoTrack"),
    );
  }
}
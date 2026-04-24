import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_banco_dados/firebase_options.dart';
import 'package:projeto_banco_dados/src/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //chama o tela inicial do APP
  runApp(FilmesApp());
}
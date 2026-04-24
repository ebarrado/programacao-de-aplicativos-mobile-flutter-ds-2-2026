import 'package:flutter/material.dart';

class FilmesApp extends StatelessWidget {
  const FilmesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cadastrar Filmes",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true
      ),
      home: const Placeholder() //chamar a classe de FilmesPage
    );
  }
}
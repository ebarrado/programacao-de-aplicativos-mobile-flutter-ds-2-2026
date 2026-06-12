import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TesteFirebase(),
    );
  }
}

class TesteFirebase extends StatefulWidget {
  const TesteFirebase({super.key});

  @override
  State<TesteFirebase> createState() => _TesteFirebaseState();
}

class _TesteFirebaseState extends State<TesteFirebase> {
  String status = "Clique no botão";

  Future<void> testarFirebase() async {
    try {
      setState(() {
        status = "Enviando...";
      });

      await FirebaseFirestore.instance.collection('teste').add({
        'nome': 'EcoTrack',
        'status': 'funcionando',
        'data': DateTime.now().toString(),
      });

      setState(() {
        status = "Firebase funcionando ✅";
      });
    } catch (e) {
      setState(() {
        status = "ERRO: $e";
      });

      debugPrint("ERRO FIREBASE:");
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste Firebase'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                status,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: testarFirebase,
                child: const Text('TESTAR FIREBASE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TesteFirebase extends StatelessWidget {
  const TesteFirebase({super.key});

  Future<void> testar() async {
    await FirebaseFirestore.instance.collection('teste').add({
      'nome': 'EcoTrack',
      'status': 'funcionando',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: testar,
          child: const Text('Testar Firebase'),
        ),
      ),
    );
  }
}
// lib/screens/register_screen.dart

import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final turmaController = TextEditingController();

  String tipo = 'aluno';

  bool loading = false;

  final AuthService _authService = AuthService();

  Future<void> registrar() async {
    setState(() {
      loading = true;
    });

    final erro = await _authService.registrar(
      nome: nomeController.text.trim(),
      email: emailController.text.trim(),
      senha: senhaController.text.trim(),
      tipo: tipo,
      turma: turmaController.text.trim(),
    );

    setState(() {
      loading = false;
    });

    if (erro != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erro)),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EEF4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CAF50),
        title: const Text(
          'Cadastro',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: turmaController,
              decoration: const InputDecoration(
                labelText: 'Turma',
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: tipo,
              items: const [
                DropdownMenuItem(
                  value: 'aluno',
                  child: Text('Aluno'),
                ),
                DropdownMenuItem(
                  value: 'professor',
                  child: Text('Professor'),
                ),
                DropdownMenuItem(
                  value: 'funcionario',
                  child: Text('Funcionário'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  tipo = value!;
                });
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: loading ? null : registrar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                ),
                child: loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:app_ecotrack_3_a/screens/register_screen.dart';

import '/services/auth_service.dart';
import 'package:flutter/material.dart';

//com comandos para facilitar
//stl - para criação de classes Statefull /Stat

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //criar as variaveis
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool ocultarSenha = true;
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                //alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    "logo_ecotrack.png",
                    //width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          const Color.fromARGB(0, 243, 243, 243),
                          const Color.fromARGB(100, 15, 83, 38),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 150),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite seu e-mail";
                  }
                  if (!value.contains("@") || !value.contains(".")) {
                    return "E-mail Inválido";
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite sua senha";
                  }
                  if (value.length < 6) {
                    return "Senha deve ter no mínimo 6 caracteres";
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    //print("Relizar Login");
                    validarLogin();
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //função validar login
  void validarLogin() {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      String senha = senhaController.text;

      String? resultado = authService.login(email, senha);

      if (resultado != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(resultado)));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login Realizado com Sucesso")));
      }
    }
  }
}

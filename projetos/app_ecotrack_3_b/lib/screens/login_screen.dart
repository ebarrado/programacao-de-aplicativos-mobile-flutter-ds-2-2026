import 'package:app_ecotrack_3_b/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool ocultarSenha = true;
  final AuthService authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.,
            children: [
              Center(
                child: Stack(
                  children: [
                    Image.asset(
                      "logo_ecotrack.png",
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 155,
                      height: 155,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            const Color.fromARGB(100, 120, 173, 121),
                            const Color.fromARGB(0, 172, 41, 41),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 150),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefix: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 5, 110, 14),
                      width: 6,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 5, 110, 14),
                      width: 3,
                    ),
                  ),
                ),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Digite seu E-mail";
                  }
                  if(!value.contains("@") || !value.contains(".")){
                    return "E-mail Inválido";
                  }
                  return null;
                } ,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(                  
                  labelText: 'Password',
                  prefix: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 5, 110, 14),
                      width: 6,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 5, 110, 14),
                      width: 3,
                    ),
                  ),
                ),
                validator: (value){
                  if (value == null || value.isEmpty){
                    return "Digite sua senha";
                  }
                  if (value.length < 6){
                    return "Senha deve ter no mínimo 6 caracteres";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(                  
                  style: ButtonStyle(                    
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.green,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.green,
                    ),
                  ),
                  onPressed: () {
                    validarLogin();
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
  //função para validar login
  void validarLogin(){
    if (_formkey.currentState!.validate()){
      String email = emailController.text;
      String senha = senhaController.text;

      String? resultado = authService.login(email, senha);

      if (resultado != null){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              resultado
            )
            )
          );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Login Realizado com Sucesso!!!"
            )
            )
          

        );
      }
    }
  }
}

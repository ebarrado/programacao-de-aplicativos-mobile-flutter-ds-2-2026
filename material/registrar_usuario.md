# Tela para Cadastrar Usuário

Crie um novo arquivo na pasta `screen`- `register_screen.dart`

```dart
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              children: [

                TextFormField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder()
                  ),

                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Digite seu nome";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: sobrenomeController,
                  decoration: InputDecoration(
                    labelText: "Sobrenome",
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder()
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder()
                  ),

                  validator: (value){

                    if(value == null || value.isEmpty){
                      return "Digite seu e-mail";
                    }

                    if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                      return "Digite um e-mail válido";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: telefoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Telefone",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder()
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder()
                  ),

                  validator: (value){

                    if(value == null || value.isEmpty){
                      return "Digite uma senha";
                    }

                    if(value.length < 6){
                      return "Senha deve ter no mínimo 6 caracteres";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: confirmarSenhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirmar Senha",
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder()
                  ),

                  validator: (value){

                    if(value != senhaController.text){
                      return "As senhas não coincidem";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green
                    ),

                    onPressed: (){

                      if(_formKey.currentState!.validate()){

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Usuário cadastrado com sucesso"))
                        );

                        Navigator.pop(context);
                      }

                    },

                    child: Text(
                      "Cadastrar",
                      style: TextStyle(fontSize: 16)
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Chamar a Tela `RegisterScreen` no botão `Criar Conta`

```dart
onPressed: (){
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RegisterScreen(),
    ),
  );
}
```



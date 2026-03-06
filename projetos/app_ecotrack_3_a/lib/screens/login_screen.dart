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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,        
          children: [
            Stack(
              //alignment: Alignment.bottomLeft,
              children:[              
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
                    end:Alignment.topCenter,
                    colors: [
                     const Color.fromARGB(0, 243, 243, 243),
                      const Color.fromARGB(100, 15, 83, 38),
                      
                    ]),
                ),
              )]),
            SizedBox(height: 150,),          
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 50,),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white
                ), 
                child: Text(
                  "Criar Conta",
                  style: TextStyle(
                    fontFamily: "Arial",
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  ),
              ),

            SizedBox(height: 50 ,),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(                              
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                
                ),
                onPressed: (){
                  print("Relizar Login");
                }, 
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    fontFamily: "Arial",
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  
                  )
                ),
            )
          ],
        ),
      ),
    );
  }
}
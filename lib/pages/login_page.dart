import 'package:flutter/material.dart';
import 'package:organizador/providers/user_provider.dart';
import 'package:provider/provider.dart';

class TelaLogin extends StatelessWidget {
  TelaLogin({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              TextFormField(
                controller: usernameController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Usuário',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              TextFormField(
                textAlign: TextAlign.center,
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lógica de autenticação aqui
                  String username = usernameController.text;
                  String password = passwordController.text;
                  userProvider.setCredentials(username, password);

                  Navigator.pushNamed(context, '/principal');                  
                },
                child: const Text('Logar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastrar'); 
                },
                child: const Text(
                  'Cadastre-se',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Taverna do Pato',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 40),
                // Campo E-mail
                TextFormField(
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'nome de usuario',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator:(value){
                    if (value!.isEmpty){
                      return "Campo Obrigatório!";
                    }
                    if (value.contains("@") == false && (value.contains(".com.br")) == false) {
                      return "E-mail inválido";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Campo Senha
                TextFormField(
                  controller: _senhaController,
                  obscureText: true,
                  style: TextStyle(
                    color: Color.fromARGB(75, 255, 255, 255),
                    fontSize: 8,
                    letterSpacing: 2.0,
                  ),
                  obscuringCharacter: '●',
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {

                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Entrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
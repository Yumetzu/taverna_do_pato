import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taverna/tela_login.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _userController = TextEditingController();
  final _senhaController = TextEditingController();
  final _telefoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _userController.dispose();
    _senhaController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Taverna do Pato'),
        centerTitle: true,
        foregroundColor: Colors.deepOrange,
        backgroundColor: Colors.black87,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Cadastro',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Campo Usuario
                  TextFormField(
                    controller: _userController,
                    style: const TextStyle(color: Colors.white70),
                    decoration: const InputDecoration(
                      labelText: 'Nome de Usuário',
                      labelStyle: TextStyle(color: Colors.deepOrange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                    ),
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) return 'Digite seu nome';

                      final userRegExp = RegExp(r'^[a-zA-Z0-9]{5,}$');

                      if (!userRegExp.hasMatch(valor)) {
                        return 'O usuário deve ter mais de 4 caracteres (apenas letras e números)';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Campos Email
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white70),
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Colors.deepOrange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      )
                    ),
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) return 'Digite seu E-mail';

                      final emailRegExp = RegExp(r'^[a-zA-Z][\w-\.]*@([\w-]+\.)+[\w-]{2,4}$');

                      if (!emailRegExp.hasMatch(valor)) {
                        return 'E-mail deve começar com letra e ser válido (ex: pato@taverna.com)';
                      }
                      return null;
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Campo Telefone
                  TextFormField(
                    controller: _telefoneController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                    style: const TextStyle(color: Colors.white70),
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                      labelStyle: TextStyle(color: Colors.deepOrange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      )
                    ),
                    validator: (valor) {
                      if (valor == null || valor.isEmpty) return 'Digite seu Telefone';

                      final telefoneRegExp = RegExp(r'^[1-9]{2}9[0-9]{8}$');

                      if (!telefoneRegExp.hasMatch(valor)) {
                        return 'Telefone inválido (use DDD + 9 + número)';
                      }
                      return null;
                    }
                  ),
                  const SizedBox(height: 16),
                  // Campo Senha
                  TextFormField(
                    controller: _senhaController,
                    obscureText: true,
                    obscuringCharacter: '●',
                    style:  const TextStyle(
                      color: Color.fromARGB(75, 255, 255, 255),
                      fontSize: 8,
                      letterSpacing: 2.0,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.deepOrange),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      )
                    ),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) return 'Digite sua senha';

                        final senhaRegExp = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$');

                        if (!senhaRegExp.hasMatch(valor)) {
                          return 'A senha deve ter 8+ caracteres, 1 maiúscula, 1 número e 1 símbolo (!@#\$&*~)';
                        }
                        return null;
                      }
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("Usuário: ${_userController.text}");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("CADASTRAR"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Já tem uma conta?",
                        style: TextStyle(color: Colors.white70),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => TelaLogin()),
                          );
                        },
                        child: const Text(
                          "Faça Login",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
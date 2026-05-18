import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taverna/tela_login.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  // --- CONTROLE DE TESTE VISUAL ---
  final bool usarMetodoA = true;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _userController = TextEditingController();
  final _senhaController = TextEditingController();
  final _telefoneController = TextEditingController();
  bool invisivel = true;

  void toggleSenhaInvisivel() {
    setState(() {
      invisivel = !invisivel;
    });
  }

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
    final Color corMetodoA = const Color(0xFF2D2D2D); // Mais claro
    final Color corMetodoB = const Color(0xFF161616); // Mais escuro

    final Color corCardFormulario = usarMetodoA ? corMetodoA : corMetodoB;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Taverna do Pato'),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(color: Color(0xFF3A2D23), height: 1.0,)
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // =========================================================
                  // O CARD DO FORMULÁRIO
                  // =========================================================
                  Container(
                    padding: const EdgeInsets.all(20.0), // Espaço interno do card, não esquecer
                    decoration: BoxDecoration(
                      color: corCardFormulario, // Altera dinamicamente com usarMetodoA
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Cadastro',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Campo Usuario
                        TextFormField(
                          controller: _userController,
                          decoration: const InputDecoration(
                            labelText: 'Nome de Usuário',
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
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                          ),
                          validator: (valor) {
                            if (valor == null || valor.isEmpty) return 'Digite seu E-mail';
                            final emailRegExp = RegExp(r'^[a-zA-Z][\w-.]*@([\w-]+.)+[\w-]{2,4}$');
                            if (!emailRegExp.hasMatch(valor)) {
                              return 'E-mail deve começar com letra e ser válido (ex: pato@taverna.com)';
                            }
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
                            decoration: const InputDecoration(
                              labelText: 'Telefone',
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
                            obscureText: invisivel,
                            obscuringCharacter: '●',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                              letterSpacing: 2.0,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  toggleSenhaInvisivel();
                                },
                                child: const Icon(Icons.password),
                              ),
                              labelText: 'Senha',
                            ),
                            validator: (valor) {
                              return Validacoes().validasenha(valor);
                            }
                        ),
                        const SizedBox(height: 28),

                        //Botão Cadastrar
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (kDebugMode) {
                                  print("Usuário: ${_userController.text}");
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text("CADASTRAR"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // =========================================================

                  const SizedBox(height: 24),

                  // Rodapé
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
                            MaterialPageRoute(builder: (context) => const TelaLogin()),
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

class Validacoes {
  String? validasenha(String? valor) {
    if (valor == null || valor.isEmpty) return 'Digite sua senha';
    final senhaRegExp = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#/$&*~]).{8,}$');
    if (!senhaRegExp.hasMatch(valor)) {
      return 'A senha deve ter 8+ caracteres, 1 maiúscula, 1 número e 1 símbolo (!@#\$&*~)';
    }
    return null;
  }
}
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  // --- Área de Estado(Func. e Var)
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nomeUserController = TextEditingController();
  final _senhaController = TextEditingController();
}

void _enviarFormulario(){
  if (_formKey.currentState!.validate()) {
    print("Dados prontos para envio: ${_emailController.text}");
  }
}
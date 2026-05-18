import 'package:flutter/material.dart';
import 'package:taverna/tela_login.dart';
import 'package:taverna/tela_cadastro.dart';

void main() {
  runApp(const MinhaRedeSocial());
}

class MinhaRedeSocial extends StatelessWidget {
  const MinhaRedeSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taverna do Pato',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(enabledBorder:
        OutlineInputBorder(
        borderSide: BorderSide(color: Colors.deepOrange)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber),
      ),
        ),
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      home: const TelaCadastro(),
    );
  }
}
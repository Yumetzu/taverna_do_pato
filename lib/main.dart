import 'package:flutter/material.dart';
import 'package:taverna/tela_cadastro.dart';

void main() {
  runApp(const MinhaRedeSocial());
}

class MinhaRedeSocial extends StatelessWidget {
  const MinhaRedeSocial({super.key});

  @override
  Widget build(BuildContext context) {
    // Definição das cores
    const corFundo = Color(0xFF212121);
    const corMel = Color(0xFFD67D2A);
    const corVerdePato = Color(0xFF2C5E43);
    const corPergaminho = Color(0xFFF4EAD4);
    const corCardFormulario = Color(0xFF2D2D2D);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taverna do Pato',

      theme: ThemeData(
        brightness: Brightness.dark, // tema escuro
        scaffoldBackgroundColor: corFundo,

        //Paleta De Cores
        colorScheme: const ColorScheme.dark(
          primary: corMel,
          secondary: corVerdePato,
          surface: Color(0xFF2A2018),
          error: Color(0xFFCF6679),
        ),

        //Tipografia
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: corPergaminho),
          bodyLarge: TextStyle(color: corPergaminho),
        ),

        // App Bar
        appBarTheme: AppBarTheme(
          backgroundColor: corFundo,
          foregroundColor: corMel,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: corMel,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
          // Borda Inferior App Bar
          shape: Border(
            bottom: BorderSide(
              color:Color(0xFF3A2D23),
              width: 1.0,
            )
          ),
        ),

        // Inputs Formulario
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4A3B2F), width: 1.5)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: corMel, width: 2.0),
      ),
        labelStyle: TextStyle(color: corPergaminho),
        floatingLabelStyle: TextStyle(color: corMel),
        ),
        useMaterial3: true,
      ),
      home: const TelaCadastro(),
    );
  }
}
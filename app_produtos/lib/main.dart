import 'package:flutter/material.dart';
import 'screens/lista_produtos.dart';

void main() {
  runApp(const AppProdutos());
}

class AppProdutos extends StatelessWidget {
  const AppProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Produtos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
        ),
        useMaterial3: true,
      ),
      home: const ListaProdutos(),
    );
  }
}
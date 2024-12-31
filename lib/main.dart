import 'package:flutter/material.dart';
import 'screens/listar_produtos.dart'; // Importe a tela

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App da Sorveteria',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListarProdutosPage(), // Inicializar com a tela de produtos
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:neo_ice/providers/vendedor_provider.dart';
import 'package:neo_ice/database/app_database.dart'; // Ajuste o caminho conforme necessário.


class AdicionarVendedorPage extends ConsumerWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  AdicionarVendedorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Vendedor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final vendedor = VendedoresCompanion(
                  nome: drift.Value(_nomeController.text),
                );

                ref.read(vendedorProvider.notifier).adicionarVendedor(vendedor);
                Navigator.pop(context);
              },
              child: const Text('Adicionar Vendedor'),
            ),
          ],
        ),
      ),
    );
  }
}

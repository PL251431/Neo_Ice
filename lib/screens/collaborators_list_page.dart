import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/widgets/new_collaborator_modal.dart';
import 'package:neo_ice/providers/vendedor_provider.dart';
import 'package:neo_ice/widgets/collaborator_card.dart';

class CollaboratorListPage extends ConsumerWidget {
  const CollaboratorListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendedores = ref.watch(vendedorProvider);

    return Scaffold(
      body: vendedores.isEmpty
          ? const Center(child: Text('Nenhum vendedor encontrado.'))
          : ListView.builder(
              itemCount: vendedores.length,
              itemBuilder: (context, index) {
                final vendedor = vendedores[index];
                return CollaboratorCard(
                    nome: vendedor.nome, numero: vendedor.id);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdicionarVendedorPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

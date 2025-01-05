import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/screens/adicionar_vendedor_page.dart';
import 'package:neo_ice/providers/vendedor_provider.dart';

class ListarVendedoresPage extends ConsumerWidget {
  const ListarVendedoresPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendedores = ref.watch(vendedorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Vendedores'),
      ),
      body: vendedores.isEmpty
          ? const Center(child: Text('Nenhum vendedor encontrado.'))
          : ListView.builder(
              itemCount: vendedores.length,
              itemBuilder: (context, index) {
                final vendedor = vendedores[index];
                return ListTile(
                  title: Text('Vendedor: ${vendedor.nome}'),
                  subtitle: Text('ID: ${vendedor.id}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      ref.read(vendedorProvider.notifier).excluirVendedor(vendedor.id);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  AdicionarVendedorPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

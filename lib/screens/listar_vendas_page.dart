import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/database/app_database.dart';
import 'package:neo_ice/providers/venda_provider.dart';
import 'package:drift/drift.dart' as drift;

class ListarVendasPage extends ConsumerWidget {
  const ListarVendasPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendas = ref.watch(vendaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Vendas'),
      ),
      body: vendas.isEmpty
          ? const Center(child: Text('Nenhuma venda encontrada.'))
          : ListView.builder(
              itemCount: vendas.length,
              itemBuilder: (context, index) {
                final venda = vendas[index];
                return ListTile(
                  title: Text('Venda #${venda.id}'),
                  subtitle: Text(
                      'Valor: R\$ ${venda.valor.toStringAsFixed(2)} - Data: ${venda.data.toLocal()}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      ref.read(vendaProvider.notifier).excluirVenda(venda.id);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(vendaProvider.notifier).adicionarVenda(
                VendasCompanion(
                  produtoId: drift.Value(1),
                  vendedorId: drift.Value(1),
                  valor: drift.Value(100.00),
                  data: drift.Value(DateTime.now()),
                ),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

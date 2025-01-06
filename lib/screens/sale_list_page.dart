import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/widgets/new_sale_modal.dart';
import 'package:neo_ice/providers/venda_provider.dart';
import 'package:neo_ice/widgets/sale_card.dart';

class SalesListPage extends ConsumerWidget {
  const SalesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendas = ref.watch(vendaProvider);

    return Stack(
      children: [
        vendas.isEmpty
            ? const Center(child: Text('Nenhuma venda encontrada.'))
            : ListView.builder(
                itemCount: vendas.length,
                itemBuilder: (context, index) {
                  final venda = vendas[index];
                  return SaleCard(
                    venda: venda.id,
                    valor: venda.valor,
                    data: venda.data,
                  );
                },
              ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdicionarVendaPage(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:neo_ice/providers/produto_provider.dart';
import 'package:neo_ice/providers/venda_provider.dart';
import 'package:neo_ice/providers/vendedor_provider.dart';

class SaleModal extends ConsumerWidget {
  final int id;

  const SaleModal({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final venda = ref.watch(vendaProvider.notifier).obterVendaPorId(id);
    final produto =
        ref.watch(produtoProvider.notifier).obterProdutoPorId(venda!.produtoId);
    final vendedor = ref
        .watch(vendedorProvider.notifier)
        .obterVendedorPorId(venda.vendedorId);

    // Formatação da data
    String dataFormatada = DateFormat('dd/MM/yyyy').format(venda.data);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nome e outros dados da venda
            Text(
              'Venda ID: #${venda.id}',
              style: const TextStyle(fontSize: 40),
            ),
            Divider(),
            Text(
              'Produto: ${produto?.nome}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Vendedor: ${vendedor?.nome}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Data: $dataFormatada',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Fechar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: const Text('Excluir'),
                  onPressed: () {
                    ref.read(vendaProvider.notifier).excluirVenda(venda.id);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

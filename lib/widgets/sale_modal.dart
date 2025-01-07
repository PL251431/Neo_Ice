import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/providers/venda_provider.dart';

class SaleModal extends ConsumerWidget {
  final int id;

  const SaleModal({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final venda = ref.watch(vendaProvider.notifier).obterVendaPorId(id);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(15),
        child: venda != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome: ${venda.id}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Valor: ${venda.produtoId}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Valor: ${venda.vendedorId}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Valor: ${venda.valor}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
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
                            }),
                        ElevatedButton(
                            child: const Text('Excluir'),
                            onPressed: () {
                              ref
                                  .read(vendaProvider.notifier)
                                  .excluirVenda(venda.id);

                              Navigator.of(context).pop();
                            }),
                      ])
                ],
              )
            : Column(
                children: [
                  const Text('Produto não encontrado.'),
                  TextButton(
                      child: const Text('Fechar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              ),
      ),
    );
  }
}

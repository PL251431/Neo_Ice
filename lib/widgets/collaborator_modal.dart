import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/providers/vendedor_provider.dart';

class CollaboratorModal extends ConsumerWidget {
  final int id;

  const CollaboratorModal({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendedor =
        ref.watch(vendedorProvider.notifier).obterVendedorPorId(id);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(15),
        child: vendedor != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome: ${vendedor.nome}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Divider(),
                  Text(
                    'ID Colaborador: ${vendedor.id}',
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
                                  .read(vendedorProvider.notifier)
                                  .excluirVendedor(vendedor.id);

                              Navigator.of(context).pop();
                            }),
                      ])
                ],
              )
            : Column(
                children: [
                  const Text('Vendedor não encontrado.'),
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

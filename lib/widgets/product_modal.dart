import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/providers/produto_provider.dart';

class ProdutcModal extends ConsumerWidget {
  final int id;

  const ProdutcModal({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produto = ref.watch(produtoProvider.notifier).obterProdutoPorId(id);
    final imageProvider =
        produto?.imagem != null && File(produto!.imagem).existsSync()
            ? FileImage(File(produto.imagem))
            : const AssetImage('assets/images/default.png')
                as ImageProvider<Object>;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(15),
        child: produto != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: imageProvider,
                      radius: 110,
                    ),
                  ),
                  Divider(),
                  Text(
                    'Nome: ${produto.nome}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Valor: R\$ ${produto.valor}',
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
                                  .read(produtoProvider.notifier)
                                  .excluirProduto(produto.id);

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

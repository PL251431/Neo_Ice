import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/database/app_database.dart';
import 'package:neo_ice/providers/produto_provider.dart';
import 'package:neo_ice/screens/add_products.dart';
import 'dart:io';
import 'package:neo_ice/widgets/product_card.dart';

class ListarProdutosPage extends ConsumerWidget {
  const ListarProdutosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produtos = ref.watch(produtoProvider);

    return Stack(children: [
      produtos.isEmpty
          ? const Center(child: Text('Nenhum produto encontrado.'))
          : ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                final imageProvider =
                    produto.imagem != null && File(produto.imagem!).existsSync()
                        ? FileImage(File(produto.imagem!))
                        : const AssetImage('assets/images/default.png')
                            as ImageProvider<Object>;

                return ProductCard(
                  image: imageProvider,
                  name: produto.nome,
                  valor: produto.valor,
                  qtd: 10,
                  context: context,
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
                builder: (context) =>
                    AdicionarProdutoPage(db: AppDatabase()), // Ajustar aqui
              ),
            ).then((_) {
              // Recarrega os produtos ao voltar do formulário
              ref.read(produtoProvider.notifier).carregarProdutos();
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    ]);
  }
}
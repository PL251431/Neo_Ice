import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/database/app_database.dart';
import 'package:neo_ice/providers/produto_provider.dart';
import 'package:neo_ice/widgets/new_product_modal.dart';
import 'package:neo_ice/widgets/product_modal.dart';
import 'dart:io';
import 'package:neo_ice/widgets/product_card.dart';

class ProdutcsListPage extends ConsumerWidget {
  const ProdutcsListPage({super.key});

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
                final imageProvider = File(produto.imagem).existsSync()
                    ? FileImage(File(produto.imagem))
                    : const AssetImage('assets/images/default.png')
                        as ImageProvider<Object>;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdutoPage(), // Ajustar aqui
                      ),
                    );
                  },
                  child: ProductCard(
                    image: imageProvider,
                    name: produto.nome,
                    valor: produto.valor,
                    context: context,
                  ),
                );
              },
            ),
      Positioned(
        bottom: 20,
        right: 20,
        child: FloatingActionButton(
          onPressed: () {
            mostrarAdicionarProdutoModal(context, AppDatabase());
          },
          child: const Icon(Icons.add),
        ),
      ),
    ]);
  }
}

mostrarAdicionarProdutoModal(BuildContext context, AppDatabase db) {
  showDialog(
    context: context,
    builder: (context) => AdicionarProdutoModal(db: db),
  );
}

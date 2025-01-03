import 'package:flutter/material.dart';
import 'package:neo_ice/database/app_database.dart';
import 'package:neo_ice/screens/add_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/providers/produto_provider.dart';
import 'dart:io';

class ListarProdutosPage extends ConsumerWidget {
  const ListarProdutosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produtos = ref.watch(produtoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
      ),
      body: produtos.isEmpty
          ? const Center(child: Text('Nenhum produto encontrado.'))
          : ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: produto.imagem.startsWith('http')
                        ? NetworkImage(produto.imagem)
                        : FileImage(File(produto.imagem)) as ImageProvider,
                    onBackgroundImageError: (_, __) =>
                        const Icon(Icons.image),
                  ),
                  title: Text(produto.nome),
                  subtitle:
                      Text('Preço: R\$ ${produto.valor.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      ref.read(produtoProvider.notifier).excluirProduto(
                            produto.id,
                          );
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
    );
  }
}
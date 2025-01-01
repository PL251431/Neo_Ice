import 'package:flutter/material.dart';
import 'package:neo_ice/database/app_database.dart';
import 'package:drift/drift.dart' as drift;

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  
  final AppDatabase db = AppDatabase();
  late Future<List<Produto>> produtosFuture;

  @override
  void initState() {
    super.initState();
    produtosFuture = db.listarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
      ),
      body: FutureBuilder<List<Produto>>(
        future: produtosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar produtos: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nenhum produto encontrado.'),
            );
          }

          final produtos = snapshot.data!;
          return ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              final produto = produtos[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(produto.imagem),
                  onBackgroundImageError: (_, __) => const Icon(Icons.image),
                ),
                title: Text(produto.nome),
                subtitle: Text('Preço: R\$ ${produto.valor.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    await db.excluirProduto(produto.id);
                    setState(() {
                      produtosFuture = db.listarProdutos();
                    });
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await db.inserirProduto(ProdutosCompanion(
            nome: drift.Value('Novo Produto'),
            valor: drift.Value(10.00),
            imagem: drift.Value(
                'https://via.placeholder.com/150'),
          ));
          setState(() {
            produtosFuture = db.listarProdutos();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

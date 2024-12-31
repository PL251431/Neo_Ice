import 'package:flutter/material.dart';
import 'package:neo_ice/database/app_database.dart'; // Importe o banco de dados
import 'package:drift/drift.dart' as drift;


class ListarProdutosPage extends StatefulWidget {
  const ListarProdutosPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListarProdutosPageState createState() => _ListarProdutosPageState();
}

class _ListarProdutosPageState extends State<ListarProdutosPage> {
  
  final AppDatabase db = AppDatabase(); // Instância do banco de dados
  late Future<List<Produto>> produtosFuture; // Lista de produtos futura

  @override
  void initState() {
    super.initState();
    produtosFuture = db.listarProdutos(); // Carregar os produtos ao iniciar
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
                      produtosFuture = db.listarProdutos(); // Atualizar lista
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
          // Exemplo de adicionar um produto
          await db.inserirProduto(ProdutosCompanion(
            nome: drift.Value('Novo Produto'),
            valor: drift.Value(10.00),
            imagem: drift.Value(
                'https://via.placeholder.com/150'), // URL da imagem placeholder
          ));
          setState(() {
            produtosFuture = db.listarProdutos(); // Atualizar lista
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

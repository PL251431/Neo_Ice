import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/database/app_database.dart';

final produtoProvider = StateNotifierProvider<ProdutoNotifier, List<Produto>>(
  (ref) => ProdutoNotifier(),
);

class ProdutoNotifier extends StateNotifier<List<Produto>> {
  final AppDatabase _db = AppDatabase();

  ProdutoNotifier() : super([]) {
    carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    final produtos = await _db.listarProdutos();
    state = produtos;
  }

  Future<void> adicionarProduto(ProdutosCompanion produto) async {
    await _db.inserirProduto(produto);
    await carregarProdutos(); // Atualiza a lista
  }

  Future<void> excluirProduto(int id) async {
    await _db.excluirProduto(id);
    await carregarProdutos(); // Atualiza a lista
  }

  Produto? obterProdutoPorId(int id) {
    try {
      return state.firstWhere((produto) => produto.id == id);
    } catch (e) {
      return null;
    }
  }
}

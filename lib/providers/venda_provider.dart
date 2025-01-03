import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/database/app_database.dart';

final vendaProvider = StateNotifierProvider<VendaNotifier, List<Venda>>((ref) {
  final db = AppDatabase();
  return VendaNotifier(db);
});

class VendaNotifier extends StateNotifier<List<Venda>> {
  final AppDatabase db;

  VendaNotifier(this.db) : super([]) {
    carregarVendas();
  }

  Future<void> carregarVendas() async {
    final vendas = await db.listarVendas();
    state = vendas;
  }

  Future<void> adicionarVenda(VendasCompanion venda) async {
    await db.inserirVenda(venda);
    carregarVendas();
  }

  Future<void> excluirVenda(int id) async {
    await db.excluirVenda(id);
    carregarVendas();
  }
}

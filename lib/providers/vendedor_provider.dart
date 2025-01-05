import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/database/app_database.dart';

final vendedorProvider = StateNotifierProvider<VendedorNotifier, List<Vendedor>>(
  (ref) => VendedorNotifier(),
);

class VendedorNotifier extends StateNotifier<List<Vendedor>> {
  final AppDatabase _db = AppDatabase();

  VendedorNotifier() : super([]) {
    carregarVendedores();
  }

  Future<void> carregarVendedores() async {
    final vendedores = await _db.listarVendedores();
    state = vendedores;
  }

  Future<void> adicionarVendedor(VendedoresCompanion vendedor) async {
    await _db.inserirVendedor(vendedor);
    await carregarVendedores(); // Atualiza a lista
  }

  Future<void> excluirVendedor(int id) async {
    await _db.excluirVendedor(id);
    await carregarVendedores(); // Atualiza a lista
  }
}

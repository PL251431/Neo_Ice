import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/database/app_database.dart';

final vendedorProvider = FutureProvider<List<Vendedor>>((ref) async {
  final db = AppDatabase();
  return await db.listarVendedores();
});

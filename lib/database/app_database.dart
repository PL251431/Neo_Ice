import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// Importação para gerar o código automaticamente
part 'app_database.g.dart';

// Tabela de Usuários (Gerente)
class Usuarios extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 1, max: 50)();
  TextColumn get email => text().unique().withLength(min: 1, max: 100)();
  TextColumn get senha => text().withLength(min: 6, max: 50)();
}

// Tabela de Produtos
class Produtos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 1, max: 100)();
  RealColumn get valor => real()();
  TextColumn get imagem => text().withLength(min: 1, max: 255)();
}

// Tabela de Vendedores
class Vendedores extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 1, max: 100)();
}

// Tabela de Vendas
class Vendas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get vendedorId =>
      integer().customConstraint('REFERENCES vendedores(id) NOT NULL')();
  IntColumn get produtoId =>
      integer().customConstraint('REFERENCES produtos(id) NOT NULL')();
  DateTimeColumn get data => dateTime()();
  RealColumn get valor => real()();
}

// Banco de dados principal
@DriftDatabase(tables: [Produtos, Usuarios, Vendedores, Vendas])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Método para listar todos os produtos
  Future<List<Produto>> listarProdutos() {
    return select(produtos).get();
  }

  // Método para inserir um novo produto
  Future<int> inserirProduto(ProdutosCompanion produto) {
    return into(produtos).insert(produto);
  }

  // Método para excluir um produto
  Future<int> excluirProduto(int id) {
    return (delete(produtos)..where((p) => p.id.equals(id))).go();
  }

  @override
  int get schemaVersion => 1; // Atualize conforme necessário
}

// Função para abrir a conexão com o banco de dados
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/app_database.sqlite');
    return NativeDatabase(file);
  });
}


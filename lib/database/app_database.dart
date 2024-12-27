import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// Importação para gerar o código automaticamente
part 'app_database.g.dart';

// Tabela de Usuários (Gerente)
class Usuarios extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text()();
  TextColumn get email => text().unique()();
  TextColumn get senha => text()();
}

// Tabela de Produtos
class Produtos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text()();
  RealColumn get valor => real()();
  TextColumn get imagem => text()();
}

// Tabela de Vendedores
class Vendedores extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text()();
}

// Tabela de Vendas
class Vendas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get vendedorId =>
      integer().customConstraint('REFERENCES vendedores(id)')();
  IntColumn get produtoId =>
      integer().customConstraint('REFERENCES produtos(id)')();
  DateTimeColumn get data => dateTime()();
  RealColumn get valor => real()();
}

// Banco de dados principal
@DriftDatabase(tables: [Usuarios, Produtos, Vendedores, Vendas])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// Função para abrir a conexão com o banco de dados
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/app_database.sqlite');
    return NativeDatabase(file);
  });
}

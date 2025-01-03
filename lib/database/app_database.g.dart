// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProdutosTable extends Produtos with TableInfo<$ProdutosTable, Produto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProdutosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _valorMeta = const VerificationMeta('valor');
  @override
  late final GeneratedColumn<double> valor = GeneratedColumn<double>(
      'valor', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _imagemMeta = const VerificationMeta('imagem');
  @override
  late final GeneratedColumn<String> imagem = GeneratedColumn<String>(
      'imagem', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, nome, valor, imagem];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'produtos';
  @override
  VerificationContext validateIntegrity(Insertable<Produto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('valor')) {
      context.handle(
          _valorMeta, valor.isAcceptableOrUnknown(data['valor']!, _valorMeta));
    } else if (isInserting) {
      context.missing(_valorMeta);
    }
    if (data.containsKey('imagem')) {
      context.handle(_imagemMeta,
          imagem.isAcceptableOrUnknown(data['imagem']!, _imagemMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Produto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Produto(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      valor: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}valor'])!,
      imagem: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}imagem']),
    );
  }

  @override
  $ProdutosTable createAlias(String alias) {
    return $ProdutosTable(attachedDatabase, alias);
  }
}

class Produto extends DataClass implements Insertable<Produto> {
  final int id;
  final String nome;
  final double valor;
  final String? imagem;
  const Produto(
      {required this.id, required this.nome, required this.valor, this.imagem});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['valor'] = Variable<double>(valor);
    if (!nullToAbsent || imagem != null) {
      map['imagem'] = Variable<String>(imagem);
    }
    return map;
  }

  ProdutosCompanion toCompanion(bool nullToAbsent) {
    return ProdutosCompanion(
      id: Value(id),
      nome: Value(nome),
      valor: Value(valor),
      imagem:
          imagem == null && nullToAbsent ? const Value.absent() : Value(imagem),
    );
  }

  factory Produto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Produto(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      valor: serializer.fromJson<double>(json['valor']),
      imagem: serializer.fromJson<String?>(json['imagem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'valor': serializer.toJson<double>(valor),
      'imagem': serializer.toJson<String?>(imagem),
    };
  }

  Produto copyWith(
          {int? id,
          String? nome,
          double? valor,
          Value<String?> imagem = const Value.absent()}) =>
      Produto(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        valor: valor ?? this.valor,
        imagem: imagem.present ? imagem.value : this.imagem,
      );
  Produto copyWithCompanion(ProdutosCompanion data) {
    return Produto(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      valor: data.valor.present ? data.valor.value : this.valor,
      imagem: data.imagem.present ? data.imagem.value : this.imagem,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Produto(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('valor: $valor, ')
          ..write('imagem: $imagem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, valor, imagem);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Produto &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.valor == this.valor &&
          other.imagem == this.imagem);
}

class ProdutosCompanion extends UpdateCompanion<Produto> {
  final Value<int> id;
  final Value<String> nome;
  final Value<double> valor;
  final Value<String?> imagem;
  const ProdutosCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.valor = const Value.absent(),
    this.imagem = const Value.absent(),
  });
  ProdutosCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required double valor,
    this.imagem = const Value.absent(),
  })  : nome = Value(nome),
        valor = Value(valor);
  static Insertable<Produto> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<double>? valor,
    Expression<String>? imagem,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (valor != null) 'valor': valor,
      if (imagem != null) 'imagem': imagem,
    });
  }

  ProdutosCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<double>? valor,
      Value<String?>? imagem}) {
    return ProdutosCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      valor: valor ?? this.valor,
      imagem: imagem ?? this.imagem,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (valor.present) {
      map['valor'] = Variable<double>(valor.value);
    }
    if (imagem.present) {
      map['imagem'] = Variable<String>(imagem.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProdutosCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('valor: $valor, ')
          ..write('imagem: $imagem')
          ..write(')'))
        .toString();
  }
}

class $UsuariosTable extends Usuarios with TableInfo<$UsuariosTable, Usuario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsuariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _senhaMeta = const VerificationMeta('senha');
  @override
  late final GeneratedColumn<String> senha = GeneratedColumn<String>(
      'senha', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, nome, email, senha];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'usuarios';
  @override
  VerificationContext validateIntegrity(Insertable<Usuario> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('senha')) {
      context.handle(
          _senhaMeta, senha.isAcceptableOrUnknown(data['senha']!, _senhaMeta));
    } else if (isInserting) {
      context.missing(_senhaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Usuario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Usuario(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      senha: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}senha'])!,
    );
  }

  @override
  $UsuariosTable createAlias(String alias) {
    return $UsuariosTable(attachedDatabase, alias);
  }
}

class Usuario extends DataClass implements Insertable<Usuario> {
  final int id;
  final String nome;
  final String email;
  final String senha;
  const Usuario(
      {required this.id,
      required this.nome,
      required this.email,
      required this.senha});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['email'] = Variable<String>(email);
    map['senha'] = Variable<String>(senha);
    return map;
  }

  UsuariosCompanion toCompanion(bool nullToAbsent) {
    return UsuariosCompanion(
      id: Value(id),
      nome: Value(nome),
      email: Value(email),
      senha: Value(senha),
    );
  }

  factory Usuario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Usuario(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      email: serializer.fromJson<String>(json['email']),
      senha: serializer.fromJson<String>(json['senha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'email': serializer.toJson<String>(email),
      'senha': serializer.toJson<String>(senha),
    };
  }

  Usuario copyWith({int? id, String? nome, String? email, String? senha}) =>
      Usuario(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        email: email ?? this.email,
        senha: senha ?? this.senha,
      );
  Usuario copyWithCompanion(UsuariosCompanion data) {
    return Usuario(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      email: data.email.present ? data.email.value : this.email,
      senha: data.senha.present ? data.senha.value : this.senha,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Usuario(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('email: $email, ')
          ..write('senha: $senha')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, email, senha);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Usuario &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.email == this.email &&
          other.senha == this.senha);
}

class UsuariosCompanion extends UpdateCompanion<Usuario> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> email;
  final Value<String> senha;
  const UsuariosCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.email = const Value.absent(),
    this.senha = const Value.absent(),
  });
  UsuariosCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required String email,
    required String senha,
  })  : nome = Value(nome),
        email = Value(email),
        senha = Value(senha);
  static Insertable<Usuario> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? email,
    Expression<String>? senha,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (email != null) 'email': email,
      if (senha != null) 'senha': senha,
    });
  }

  UsuariosCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<String>? email,
      Value<String>? senha}) {
    return UsuariosCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (senha.present) {
      map['senha'] = Variable<String>(senha.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuariosCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('email: $email, ')
          ..write('senha: $senha')
          ..write(')'))
        .toString();
  }
}

class $VendedoresTable extends Vendedores
    with TableInfo<$VendedoresTable, Vendedore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VendedoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, nome];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vendedores';
  @override
  VerificationContext validateIntegrity(Insertable<Vendedore> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vendedore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vendedore(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
    );
  }

  @override
  $VendedoresTable createAlias(String alias) {
    return $VendedoresTable(attachedDatabase, alias);
  }
}

class Vendedore extends DataClass implements Insertable<Vendedore> {
  final int id;
  final String nome;
  const Vendedore({required this.id, required this.nome});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    return map;
  }

  VendedoresCompanion toCompanion(bool nullToAbsent) {
    return VendedoresCompanion(
      id: Value(id),
      nome: Value(nome),
    );
  }

  factory Vendedore.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vendedore(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
    };
  }

  Vendedore copyWith({int? id, String? nome}) => Vendedore(
        id: id ?? this.id,
        nome: nome ?? this.nome,
      );
  Vendedore copyWithCompanion(VendedoresCompanion data) {
    return Vendedore(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Vendedore(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vendedore && other.id == this.id && other.nome == this.nome);
}

class VendedoresCompanion extends UpdateCompanion<Vendedore> {
  final Value<int> id;
  final Value<String> nome;
  const VendedoresCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
  });
  VendedoresCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
  }) : nome = Value(nome);
  static Insertable<Vendedore> custom({
    Expression<int>? id,
    Expression<String>? nome,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
    });
  }

  VendedoresCompanion copyWith({Value<int>? id, Value<String>? nome}) {
    return VendedoresCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VendedoresCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }
}

class $VendasTable extends Vendas with TableInfo<$VendasTable, Venda> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VendasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _vendedorIdMeta =
      const VerificationMeta('vendedorId');
  @override
  late final GeneratedColumn<int> vendedorId = GeneratedColumn<int>(
      'vendedor_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES vendedores(id) NOT NULL');
  static const VerificationMeta _produtoIdMeta =
      const VerificationMeta('produtoId');
  @override
  late final GeneratedColumn<int> produtoId = GeneratedColumn<int>(
      'produto_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES produtos(id) NOT NULL');
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<DateTime> data = GeneratedColumn<DateTime>(
      'data', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _valorMeta = const VerificationMeta('valor');
  @override
  late final GeneratedColumn<double> valor = GeneratedColumn<double>(
      'valor', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, vendedorId, produtoId, data, valor];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vendas';
  @override
  VerificationContext validateIntegrity(Insertable<Venda> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vendedor_id')) {
      context.handle(
          _vendedorIdMeta,
          vendedorId.isAcceptableOrUnknown(
              data['vendedor_id']!, _vendedorIdMeta));
    } else if (isInserting) {
      context.missing(_vendedorIdMeta);
    }
    if (data.containsKey('produto_id')) {
      context.handle(_produtoIdMeta,
          produtoId.isAcceptableOrUnknown(data['produto_id']!, _produtoIdMeta));
    } else if (isInserting) {
      context.missing(_produtoIdMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('valor')) {
      context.handle(
          _valorMeta, valor.isAcceptableOrUnknown(data['valor']!, _valorMeta));
    } else if (isInserting) {
      context.missing(_valorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Venda map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Venda(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      vendedorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vendedor_id'])!,
      produtoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}produto_id'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}data'])!,
      valor: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}valor'])!,
    );
  }

  @override
  $VendasTable createAlias(String alias) {
    return $VendasTable(attachedDatabase, alias);
  }
}

class Venda extends DataClass implements Insertable<Venda> {
  final int id;
  final int vendedorId;
  final int produtoId;
  final DateTime data;
  final double valor;
  const Venda(
      {required this.id,
      required this.vendedorId,
      required this.produtoId,
      required this.data,
      required this.valor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vendedor_id'] = Variable<int>(vendedorId);
    map['produto_id'] = Variable<int>(produtoId);
    map['data'] = Variable<DateTime>(data);
    map['valor'] = Variable<double>(valor);
    return map;
  }

  VendasCompanion toCompanion(bool nullToAbsent) {
    return VendasCompanion(
      id: Value(id),
      vendedorId: Value(vendedorId),
      produtoId: Value(produtoId),
      data: Value(data),
      valor: Value(valor),
    );
  }

  factory Venda.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Venda(
      id: serializer.fromJson<int>(json['id']),
      vendedorId: serializer.fromJson<int>(json['vendedorId']),
      produtoId: serializer.fromJson<int>(json['produtoId']),
      data: serializer.fromJson<DateTime>(json['data']),
      valor: serializer.fromJson<double>(json['valor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vendedorId': serializer.toJson<int>(vendedorId),
      'produtoId': serializer.toJson<int>(produtoId),
      'data': serializer.toJson<DateTime>(data),
      'valor': serializer.toJson<double>(valor),
    };
  }

  Venda copyWith(
          {int? id,
          int? vendedorId,
          int? produtoId,
          DateTime? data,
          double? valor}) =>
      Venda(
        id: id ?? this.id,
        vendedorId: vendedorId ?? this.vendedorId,
        produtoId: produtoId ?? this.produtoId,
        data: data ?? this.data,
        valor: valor ?? this.valor,
      );
  Venda copyWithCompanion(VendasCompanion data) {
    return Venda(
      id: data.id.present ? data.id.value : this.id,
      vendedorId:
          data.vendedorId.present ? data.vendedorId.value : this.vendedorId,
      produtoId: data.produtoId.present ? data.produtoId.value : this.produtoId,
      data: data.data.present ? data.data.value : this.data,
      valor: data.valor.present ? data.valor.value : this.valor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Venda(')
          ..write('id: $id, ')
          ..write('vendedorId: $vendedorId, ')
          ..write('produtoId: $produtoId, ')
          ..write('data: $data, ')
          ..write('valor: $valor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, vendedorId, produtoId, data, valor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Venda &&
          other.id == this.id &&
          other.vendedorId == this.vendedorId &&
          other.produtoId == this.produtoId &&
          other.data == this.data &&
          other.valor == this.valor);
}

class VendasCompanion extends UpdateCompanion<Venda> {
  final Value<int> id;
  final Value<int> vendedorId;
  final Value<int> produtoId;
  final Value<DateTime> data;
  final Value<double> valor;
  const VendasCompanion({
    this.id = const Value.absent(),
    this.vendedorId = const Value.absent(),
    this.produtoId = const Value.absent(),
    this.data = const Value.absent(),
    this.valor = const Value.absent(),
  });
  VendasCompanion.insert({
    this.id = const Value.absent(),
    required int vendedorId,
    required int produtoId,
    required DateTime data,
    required double valor,
  })  : vendedorId = Value(vendedorId),
        produtoId = Value(produtoId),
        data = Value(data),
        valor = Value(valor);
  static Insertable<Venda> custom({
    Expression<int>? id,
    Expression<int>? vendedorId,
    Expression<int>? produtoId,
    Expression<DateTime>? data,
    Expression<double>? valor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vendedorId != null) 'vendedor_id': vendedorId,
      if (produtoId != null) 'produto_id': produtoId,
      if (data != null) 'data': data,
      if (valor != null) 'valor': valor,
    });
  }

  VendasCompanion copyWith(
      {Value<int>? id,
      Value<int>? vendedorId,
      Value<int>? produtoId,
      Value<DateTime>? data,
      Value<double>? valor}) {
    return VendasCompanion(
      id: id ?? this.id,
      vendedorId: vendedorId ?? this.vendedorId,
      produtoId: produtoId ?? this.produtoId,
      data: data ?? this.data,
      valor: valor ?? this.valor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vendedorId.present) {
      map['vendedor_id'] = Variable<int>(vendedorId.value);
    }
    if (produtoId.present) {
      map['produto_id'] = Variable<int>(produtoId.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    if (valor.present) {
      map['valor'] = Variable<double>(valor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VendasCompanion(')
          ..write('id: $id, ')
          ..write('vendedorId: $vendedorId, ')
          ..write('produtoId: $produtoId, ')
          ..write('data: $data, ')
          ..write('valor: $valor')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProdutosTable produtos = $ProdutosTable(this);
  late final $UsuariosTable usuarios = $UsuariosTable(this);
  late final $VendedoresTable vendedores = $VendedoresTable(this);
  late final $VendasTable vendas = $VendasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [produtos, usuarios, vendedores, vendas];
}

typedef $$ProdutosTableCreateCompanionBuilder = ProdutosCompanion Function({
  Value<int> id,
  required String nome,
  required double valor,
  Value<String?> imagem,
});
typedef $$ProdutosTableUpdateCompanionBuilder = ProdutosCompanion Function({
  Value<int> id,
  Value<String> nome,
  Value<double> valor,
  Value<String?> imagem,
});

final class $$ProdutosTableReferences
    extends BaseReferences<_$AppDatabase, $ProdutosTable, Produto> {
  $$ProdutosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VendasTable, List<Venda>> _vendasRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.vendas,
          aliasName: $_aliasNameGenerator(db.produtos.id, db.vendas.produtoId));

  $$VendasTableProcessedTableManager get vendasRefs {
    final manager = $$VendasTableTableManager($_db, $_db.vendas)
        .filter((f) => f.produtoId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_vendasRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProdutosTableFilterComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get valor => $composableBuilder(
      column: $table.valor, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagem => $composableBuilder(
      column: $table.imagem, builder: (column) => ColumnFilters(column));

  Expression<bool> vendasRefs(
      Expression<bool> Function($$VendasTableFilterComposer f) f) {
    final $$VendasTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vendas,
        getReferencedColumn: (t) => t.produtoId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VendasTableFilterComposer(
              $db: $db,
              $table: $db.vendas,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProdutosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get valor => $composableBuilder(
      column: $table.valor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagem => $composableBuilder(
      column: $table.imagem, builder: (column) => ColumnOrderings(column));
}

class $$ProdutosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProdutosTable> {
  $$ProdutosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<double> get valor =>
      $composableBuilder(column: $table.valor, builder: (column) => column);

  GeneratedColumn<String> get imagem =>
      $composableBuilder(column: $table.imagem, builder: (column) => column);

  Expression<T> vendasRefs<T extends Object>(
      Expression<T> Function($$VendasTableAnnotationComposer a) f) {
    final $$VendasTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vendas,
        getReferencedColumn: (t) => t.produtoId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VendasTableAnnotationComposer(
              $db: $db,
              $table: $db.vendas,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProdutosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProdutosTable,
    Produto,
    $$ProdutosTableFilterComposer,
    $$ProdutosTableOrderingComposer,
    $$ProdutosTableAnnotationComposer,
    $$ProdutosTableCreateCompanionBuilder,
    $$ProdutosTableUpdateCompanionBuilder,
    (Produto, $$ProdutosTableReferences),
    Produto,
    PrefetchHooks Function({bool vendasRefs})> {
  $$ProdutosTableTableManager(_$AppDatabase db, $ProdutosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProdutosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProdutosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProdutosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<double> valor = const Value.absent(),
            Value<String?> imagem = const Value.absent(),
          }) =>
              ProdutosCompanion(
            id: id,
            nome: nome,
            valor: valor,
            imagem: imagem,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nome,
            required double valor,
            Value<String?> imagem = const Value.absent(),
          }) =>
              ProdutosCompanion.insert(
            id: id,
            nome: nome,
            valor: valor,
            imagem: imagem,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ProdutosTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({vendasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (vendasRefs) db.vendas],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vendasRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ProdutosTableReferences._vendasRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProdutosTableReferences(db, table, p0).vendasRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.produtoId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProdutosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProdutosTable,
    Produto,
    $$ProdutosTableFilterComposer,
    $$ProdutosTableOrderingComposer,
    $$ProdutosTableAnnotationComposer,
    $$ProdutosTableCreateCompanionBuilder,
    $$ProdutosTableUpdateCompanionBuilder,
    (Produto, $$ProdutosTableReferences),
    Produto,
    PrefetchHooks Function({bool vendasRefs})>;
typedef $$UsuariosTableCreateCompanionBuilder = UsuariosCompanion Function({
  Value<int> id,
  required String nome,
  required String email,
  required String senha,
});
typedef $$UsuariosTableUpdateCompanionBuilder = UsuariosCompanion Function({
  Value<int> id,
  Value<String> nome,
  Value<String> email,
  Value<String> senha,
});

class $$UsuariosTableFilterComposer
    extends Composer<_$AppDatabase, $UsuariosTable> {
  $$UsuariosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get senha => $composableBuilder(
      column: $table.senha, builder: (column) => ColumnFilters(column));
}

class $$UsuariosTableOrderingComposer
    extends Composer<_$AppDatabase, $UsuariosTable> {
  $$UsuariosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get senha => $composableBuilder(
      column: $table.senha, builder: (column) => ColumnOrderings(column));
}

class $$UsuariosTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsuariosTable> {
  $$UsuariosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get senha =>
      $composableBuilder(column: $table.senha, builder: (column) => column);
}

class $$UsuariosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsuariosTable,
    Usuario,
    $$UsuariosTableFilterComposer,
    $$UsuariosTableOrderingComposer,
    $$UsuariosTableAnnotationComposer,
    $$UsuariosTableCreateCompanionBuilder,
    $$UsuariosTableUpdateCompanionBuilder,
    (Usuario, BaseReferences<_$AppDatabase, $UsuariosTable, Usuario>),
    Usuario,
    PrefetchHooks Function()> {
  $$UsuariosTableTableManager(_$AppDatabase db, $UsuariosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsuariosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsuariosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsuariosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> senha = const Value.absent(),
          }) =>
              UsuariosCompanion(
            id: id,
            nome: nome,
            email: email,
            senha: senha,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nome,
            required String email,
            required String senha,
          }) =>
              UsuariosCompanion.insert(
            id: id,
            nome: nome,
            email: email,
            senha: senha,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsuariosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsuariosTable,
    Usuario,
    $$UsuariosTableFilterComposer,
    $$UsuariosTableOrderingComposer,
    $$UsuariosTableAnnotationComposer,
    $$UsuariosTableCreateCompanionBuilder,
    $$UsuariosTableUpdateCompanionBuilder,
    (Usuario, BaseReferences<_$AppDatabase, $UsuariosTable, Usuario>),
    Usuario,
    PrefetchHooks Function()>;
typedef $$VendedoresTableCreateCompanionBuilder = VendedoresCompanion Function({
  Value<int> id,
  required String nome,
});
typedef $$VendedoresTableUpdateCompanionBuilder = VendedoresCompanion Function({
  Value<int> id,
  Value<String> nome,
});

final class $$VendedoresTableReferences
    extends BaseReferences<_$AppDatabase, $VendedoresTable, Vendedore> {
  $$VendedoresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VendasTable, List<Venda>> _vendasRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.vendas,
          aliasName:
              $_aliasNameGenerator(db.vendedores.id, db.vendas.vendedorId));

  $$VendasTableProcessedTableManager get vendasRefs {
    final manager = $$VendasTableTableManager($_db, $_db.vendas)
        .filter((f) => f.vendedorId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_vendasRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$VendedoresTableFilterComposer
    extends Composer<_$AppDatabase, $VendedoresTable> {
  $$VendedoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  Expression<bool> vendasRefs(
      Expression<bool> Function($$VendasTableFilterComposer f) f) {
    final $$VendasTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vendas,
        getReferencedColumn: (t) => t.vendedorId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VendasTableFilterComposer(
              $db: $db,
              $table: $db.vendas,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$VendedoresTableOrderingComposer
    extends Composer<_$AppDatabase, $VendedoresTable> {
  $$VendedoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));
}

class $$VendedoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $VendedoresTable> {
  $$VendedoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  Expression<T> vendasRefs<T extends Object>(
      Expression<T> Function($$VendasTableAnnotationComposer a) f) {
    final $$VendasTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.vendas,
        getReferencedColumn: (t) => t.vendedorId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VendasTableAnnotationComposer(
              $db: $db,
              $table: $db.vendas,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$VendedoresTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VendedoresTable,
    Vendedore,
    $$VendedoresTableFilterComposer,
    $$VendedoresTableOrderingComposer,
    $$VendedoresTableAnnotationComposer,
    $$VendedoresTableCreateCompanionBuilder,
    $$VendedoresTableUpdateCompanionBuilder,
    (Vendedore, $$VendedoresTableReferences),
    Vendedore,
    PrefetchHooks Function({bool vendasRefs})> {
  $$VendedoresTableTableManager(_$AppDatabase db, $VendedoresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VendedoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VendedoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VendedoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
          }) =>
              VendedoresCompanion(
            id: id,
            nome: nome,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nome,
          }) =>
              VendedoresCompanion.insert(
            id: id,
            nome: nome,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$VendedoresTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({vendasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (vendasRefs) db.vendas],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vendasRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$VendedoresTableReferences._vendasRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$VendedoresTableReferences(db, table, p0)
                                .vendasRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.vendedorId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$VendedoresTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VendedoresTable,
    Vendedore,
    $$VendedoresTableFilterComposer,
    $$VendedoresTableOrderingComposer,
    $$VendedoresTableAnnotationComposer,
    $$VendedoresTableCreateCompanionBuilder,
    $$VendedoresTableUpdateCompanionBuilder,
    (Vendedore, $$VendedoresTableReferences),
    Vendedore,
    PrefetchHooks Function({bool vendasRefs})>;
typedef $$VendasTableCreateCompanionBuilder = VendasCompanion Function({
  Value<int> id,
  required int vendedorId,
  required int produtoId,
  required DateTime data,
  required double valor,
});
typedef $$VendasTableUpdateCompanionBuilder = VendasCompanion Function({
  Value<int> id,
  Value<int> vendedorId,
  Value<int> produtoId,
  Value<DateTime> data,
  Value<double> valor,
});

final class $$VendasTableReferences
    extends BaseReferences<_$AppDatabase, $VendasTable, Venda> {
  $$VendasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VendedoresTable _vendedorIdTable(_$AppDatabase db) =>
      db.vendedores.createAlias(
          $_aliasNameGenerator(db.vendas.vendedorId, db.vendedores.id));

  $$VendedoresTableProcessedTableManager get vendedorId {
    final manager = $$VendedoresTableTableManager($_db, $_db.vendedores)
        .filter((f) => f.id($_item.vendedorId));
    final item = $_typedResult.readTableOrNull(_vendedorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ProdutosTable _produtoIdTable(_$AppDatabase db) => db.produtos
      .createAlias($_aliasNameGenerator(db.vendas.produtoId, db.produtos.id));

  $$ProdutosTableProcessedTableManager get produtoId {
    final manager = $$ProdutosTableTableManager($_db, $_db.produtos)
        .filter((f) => f.id($_item.produtoId));
    final item = $_typedResult.readTableOrNull(_produtoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$VendasTableFilterComposer
    extends Composer<_$AppDatabase, $VendasTable> {
  $$VendasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get valor => $composableBuilder(
      column: $table.valor, builder: (column) => ColumnFilters(column));

  $$VendedoresTableFilterComposer get vendedorId {
    final $$VendedoresTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vendedorId,
        referencedTable: $db.vendedores,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VendedoresTableFilterComposer(
              $db: $db,
              $table: $db.vendedores,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProdutosTableFilterComposer get produtoId {
    final $$ProdutosTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.produtoId,
        referencedTable: $db.produtos,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProdutosTableFilterComposer(
              $db: $db,
              $table: $db.produtos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VendasTableOrderingComposer
    extends Composer<_$AppDatabase, $VendasTable> {
  $$VendasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get valor => $composableBuilder(
      column: $table.valor, builder: (column) => ColumnOrderings(column));

  $$VendedoresTableOrderingComposer get vendedorId {
    final $$VendedoresTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vendedorId,
        referencedTable: $db.vendedores,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VendedoresTableOrderingComposer(
              $db: $db,
              $table: $db.vendedores,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProdutosTableOrderingComposer get produtoId {
    final $$ProdutosTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.produtoId,
        referencedTable: $db.produtos,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProdutosTableOrderingComposer(
              $db: $db,
              $table: $db.produtos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VendasTableAnnotationComposer
    extends Composer<_$AppDatabase, $VendasTable> {
  $$VendasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<double> get valor =>
      $composableBuilder(column: $table.valor, builder: (column) => column);

  $$VendedoresTableAnnotationComposer get vendedorId {
    final $$VendedoresTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vendedorId,
        referencedTable: $db.vendedores,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VendedoresTableAnnotationComposer(
              $db: $db,
              $table: $db.vendedores,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProdutosTableAnnotationComposer get produtoId {
    final $$ProdutosTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.produtoId,
        referencedTable: $db.produtos,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProdutosTableAnnotationComposer(
              $db: $db,
              $table: $db.produtos,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VendasTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VendasTable,
    Venda,
    $$VendasTableFilterComposer,
    $$VendasTableOrderingComposer,
    $$VendasTableAnnotationComposer,
    $$VendasTableCreateCompanionBuilder,
    $$VendasTableUpdateCompanionBuilder,
    (Venda, $$VendasTableReferences),
    Venda,
    PrefetchHooks Function({bool vendedorId, bool produtoId})> {
  $$VendasTableTableManager(_$AppDatabase db, $VendasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VendasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VendasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VendasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> vendedorId = const Value.absent(),
            Value<int> produtoId = const Value.absent(),
            Value<DateTime> data = const Value.absent(),
            Value<double> valor = const Value.absent(),
          }) =>
              VendasCompanion(
            id: id,
            vendedorId: vendedorId,
            produtoId: produtoId,
            data: data,
            valor: valor,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int vendedorId,
            required int produtoId,
            required DateTime data,
            required double valor,
          }) =>
              VendasCompanion.insert(
            id: id,
            vendedorId: vendedorId,
            produtoId: produtoId,
            data: data,
            valor: valor,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$VendasTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({vendedorId = false, produtoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (vendedorId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.vendedorId,
                    referencedTable:
                        $$VendasTableReferences._vendedorIdTable(db),
                    referencedColumn:
                        $$VendasTableReferences._vendedorIdTable(db).id,
                  ) as T;
                }
                if (produtoId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.produtoId,
                    referencedTable:
                        $$VendasTableReferences._produtoIdTable(db),
                    referencedColumn:
                        $$VendasTableReferences._produtoIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$VendasTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VendasTable,
    Venda,
    $$VendasTableFilterComposer,
    $$VendasTableOrderingComposer,
    $$VendasTableAnnotationComposer,
    $$VendasTableCreateCompanionBuilder,
    $$VendasTableUpdateCompanionBuilder,
    (Venda, $$VendasTableReferences),
    Venda,
    PrefetchHooks Function({bool vendedorId, bool produtoId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProdutosTableTableManager get produtos =>
      $$ProdutosTableTableManager(_db, _db.produtos);
  $$UsuariosTableTableManager get usuarios =>
      $$UsuariosTableTableManager(_db, _db.usuarios);
  $$VendedoresTableTableManager get vendedores =>
      $$VendedoresTableTableManager(_db, _db.vendedores);
  $$VendasTableTableManager get vendas =>
      $$VendasTableTableManager(_db, _db.vendas);
}

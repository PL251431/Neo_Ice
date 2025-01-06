import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/database/app_database.dart';
import 'package:neo_ice/providers/produto_provider.dart';
import 'package:neo_ice/providers/vendedor_provider.dart';
import 'package:neo_ice/providers/venda_provider.dart';

class AdicionarVendaPage extends ConsumerStatefulWidget {
  const AdicionarVendaPage({super.key});

  @override
  ConsumerState<AdicionarVendaPage> createState() => _AdicionarVendaPageState();
}

class _AdicionarVendaPageState extends ConsumerState<AdicionarVendaPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _quantidadeController = TextEditingController();

  int? _produtoId;
  int? _vendedorId;
  DateTime _dataVenda = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final produtosAsync = ref.watch(produtoProvider);
    final vendedoresAsync = ref.watch(vendedorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Nova Venda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Dropdown de Produtos
              DropdownButtonFormField<int>(
                value: _produtoId,
                items: produtosAsync
                    .map((produto) => DropdownMenuItem(
                          value: produto.id,
                          child: Text(produto.nome),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _produtoId = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Produto'),
                validator: (value) =>
                    value == null ? 'Por favor, selecione um produto' : null,
              ),

              const SizedBox(height: 16),

              // Dropdown de Vendedores

              DropdownButtonFormField<int>(
                value: _vendedorId,
                items: vendedoresAsync
                    .map((vendedor) => DropdownMenuItem(
                          value: vendedor.id,
                          child: Text(vendedor.nome),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _vendedorId = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Vendedor'),
                validator: (value) =>
                    value == null ? 'Por favor, selecione um vendedor' : null,
              ),

              const SizedBox(height: 16),

// Campo de Quantidade
              TextFormField(
                controller: _quantidadeController,
                decoration: const InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade';
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return 'Quantidade deve ser um número positivo';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),
              // Seleção de Data
              Row(
                children: [
                  const Text('Data da Venda:'),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _dataVenda,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _dataVenda = pickedDate;
                        });
                      }
                    },
                    child: Text(
                      '${_dataVenda.day}/${_dataVenda.month}/${_dataVenda.year}',
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Botão para Adicionar Venda
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final produto = produtosAsync.firstWhere(
                        (p) => p.id == _produtoId); // Encontre o produto
                    final quantidade = int.parse(_quantidadeController.text);
                    final valorTotal =
                        produto.valor * quantidade; // Calcule o valor total

                    final venda = VendasCompanion(
                      produtoId: drift.Value(_produtoId!),
                      vendedorId: drift.Value(_vendedorId!),
                      valor: drift.Value(valorTotal), // Use o valor calculado
                      data: drift.Value(_dataVenda),
                    );
                    ref.read(vendaProvider.notifier).adicionarVenda(venda);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Adicionar Venda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

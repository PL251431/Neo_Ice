import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neo_ice/database/app_database.dart';
import 'package:neo_ice/providers/produto_provider.dart';
import 'package:drift/drift.dart' as drift;
import 'dart:io';

class AdicionarProdutoModal extends StatefulWidget {
  final AppDatabase db; 

  const AdicionarProdutoModal({super.key, required this.db});

  @override
  // ignore: library_private_types_in_public_api
  _AdicionarProdutoModalState createState() => _AdicionarProdutoModalState();
}

class _AdicionarProdutoModalState extends State<AdicionarProdutoModal> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _quantidadeController = TextEditingController();

  String? _imagemPath;

  Future<void> _selecionarImagem() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagemPath = pickedFile.path;
      });
    }
  }

  Future<void> _salvarProduto(WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      final nome = _nomeController.text;
      final preco = double.tryParse(_precoController.text) ?? 0.0;
      final imagem = _imagemPath ?? 'assets/images/default.png';
      final quantidade = int.tryParse(_quantidadeController.text) ?? 0;

      final produto = ProdutosCompanion(
        nome: drift.Value(nome),
        valor: drift.Value(preco),
        imagem: drift.Value(imagem),
        quantidade: drift.Value(quantidade),
      );

      await widget.db.inserirProduto(produto);
      await ref.read(produtoProvider.notifier).carregarProdutos();
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer(
          builder: (context, ref, child) {
            return Form(
              key: _formKey,
              child: ListView(
                shrinkWrap:
                    true,
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Por favor, insira o nome.'
                        : null,
                  ),
                  TextFormField(
                    controller: _precoController,
                    decoration: const InputDecoration(labelText: 'Preço'),
                    keyboardType: TextInputType.number,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Por favor, insira o preço.'
                        : double.tryParse(value) == null
                            ? 'Por favor, insira um número válido.'
                            : null,
                  ),
                  const SizedBox(height: 20),
                  _imagemPath == null
                      ? const Text('Nenhuma imagem selecionada.')
                      : Image.file(File(_imagemPath!)),
                  TextButton.icon(
                    icon: const Icon(Icons.photo),
                    label: const Text('Selecionar Imagem'),
                    onPressed: _selecionarImagem,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _salvarProduto(ref),
                    child: const Text('Salvar Produto'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
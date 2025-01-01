import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neo_ice/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'dart:io'; 

class AdicionarProdutoPage extends StatefulWidget {
  final AppDatabase db;

  const AdicionarProdutoPage({super.key, required this.db});

  @override
  // ignore: library_private_types_in_public_api
  _AdicionarProdutoPageState createState() => _AdicionarProdutoPageState();
}

class _AdicionarProdutoPageState extends State<AdicionarProdutoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  String? _imagemPath; // Caminho da imagem

  Future<void> _selecionarImagem() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery); // Seleciona imagem

    if (pickedFile != null) {
      setState(() {
        _imagemPath = pickedFile.path; // Salva o caminho da imagem
      });
    }
  }

  Future<void> _salvarProduto() async {
    if (_formKey.currentState!.validate()) {
      final nome = _nomeController.text;
      final preco = double.tryParse(_precoController.text) ?? 0.0;

      if (_imagemPath == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, selecione uma imagem.')),
        );
        return;
      }

      // Insere no banco de dados
      await widget.db.inserirProduto(ProdutosCompanion(
        nome: drift.Value(nome),
        valor: drift.Value(preco),
        imagem: drift.Value(_imagemPath!), // Salva o caminho da imagem
      ));

      // ignore: use_build_context_synchronously
      Navigator.pop(context); // Volta para a lista de produtos
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome do Produto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do produto.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _precoController,
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Insira um valor numérico válido.';
                  }
                  return null;
                },
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
                onPressed: _salvarProduto,
                child: const Text('Salvar Produto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

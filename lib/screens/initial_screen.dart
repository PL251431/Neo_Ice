import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/providers/riverpod.dart';
import 'package:neo_ice/screens/charts_screen.dart';
import 'package:neo_ice/screens/products_screen.dart';
import 'package:neo_ice/screens/listar_vendas_page.dart';
import 'package:neo_ice/screens/listar_vendedores_page.dart'; // Importe a tela de vendedores
import 'package:neo_ice/database/app_database.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observar o modo claro/escuro
    bool mode = ref.watch(lightMode);

    // Array com as telas (usando FutureBuilder para os gráficos)
    final List<Widget> screens = [
      const ListarProdutosPage(),
      const ListarVendasPage(),
      FutureBuilder<List<Produto>>(
        future: AppDatabase().listarProdutos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar dados: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum produto disponível.'));
          }
          return ChartsScreen(produtos: snapshot.data!);
        },
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Neo Ice'),
          actions: [
            mode == true
                ? const Icon(Icons.sunny)
                : const Icon(Icons.dark_mode),
            Switch(
              value: mode,
              onChanged: (newMode) {
                ref.read(lightMode.notifier).state = newMode;
              },
            ),
            IconButton(
              icon: const Icon(Icons.people), // Ícone de pessoas
              onPressed: () {
                // Navegar para a tela de vendedores
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListarVendedoresPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: screens[ref.watch(indexPage)], // Exibe a tela correspondente
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sell),
              label: 'Vendas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.equalizer),
              label: 'Monitoramento',
            ),
          ],
          currentIndex: ref.watch(indexPage), // Índice da página ativa
          onTap: (index) {
            ref.read(indexPage.notifier).state = index;
          },
        ),
      ),
    );
  }
}

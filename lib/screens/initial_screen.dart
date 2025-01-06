import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/providers/riverpod.dart';
import 'package:neo_ice/screens/monitoring_page.dart';
import 'package:neo_ice/screens/products_list_page.dart';
import 'package:neo_ice/screens/sale_list_page.dart';
import 'package:neo_ice/screens/collaborators_list_page.dart';
import 'package:neo_ice/database/app_database.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mode = ref.watch(lightMode);
    final List<Widget> screens = [
      const ProdutcsListPage(),
      const SalesListPage(),
      const CollaboratorListPage(),
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
          return MonitoringPage(produtos: snapshot.data!);
        },
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Neo Ice',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
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
          ],
        ),
        body: screens[ref.watch(indexPage)],
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
              icon: Icon(Icons.people),
              label: 'Vendedores',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.equalizer),
              label: 'Monitoramento',
            ),
          ],
          currentIndex: ref.watch(indexPage),
          selectedItemColor: Colors.lightBlueAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            ref.read(indexPage.notifier).state = index;
          },
        ),
      ),
    );
  }
}

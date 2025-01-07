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
    final List<Widget> screens = [
      const ProdutcsListPage(),
      const SalesListPage(),
      const CollaboratorListPage(),
      FutureBuilder<List<Produto>>(
        future: AppDatabase().listarProdutos(),
        builder: (context, produtoSnapshot) {
          if (produtoSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (produtoSnapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar produtos: ${produtoSnapshot.error}'),
            );
          } else if (!produtoSnapshot.hasData || produtoSnapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum produto disponível.'));
          }

          return FutureBuilder<List<Venda>>(
            future: AppDatabase().listarVendas(),
            builder: (context, vendaSnapshot) {
              if (vendaSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (vendaSnapshot.hasError) {
                return Center(
                  child: Text('Erro ao carregar vendas: ${vendaSnapshot.error}'),
                );
              } else if (!vendaSnapshot.hasData || vendaSnapshot.data!.isEmpty) {
                return const Center(child: Text('Nenhuma venda realizada.'));
              }

              // Quando tanto produtos quanto vendas estiverem disponíveis
              return MonitoringPage(
                produtos: produtoSnapshot.data!,
                vendas: vendaSnapshot.data!,
              );
            },
          );
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
            Switch(
              value: ref.watch(lightModeProvider),
              onChanged: (value) {
                ref.read(lightModeProvider.notifier).toggleTheme();
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
              label: 'Colaboradores',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.equalizer),
              label: 'Monitoramento',
            ),
          ],
          currentIndex: ref.watch(indexPage),
          selectedItemColor: Colors.lightBlueAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            ref.read(indexPage.notifier).state = index;
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/providers/riverpod.dart';
import 'package:neo_ice/screens/monitoring_page.dart';
import 'package:neo_ice/screens/products_list_page.dart';
import 'package:neo_ice/screens/sale_list_page.dart';
import 'package:neo_ice/screens/collaborators_list_page.dart';
import 'package:neo_ice/database/app_database.dart';
import 'package:neo_ice/widgets/switch_theme_app.dart';

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
              child:
                  Text('Erro ao carregar produtos: ${produtoSnapshot.error}'),
            );
          } else if (!produtoSnapshot.hasData ||
              produtoSnapshot.data!.isEmpty) {
            return Stack(children: [
              const Positioned(
                top: 20,
                left: 20,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'MONITORAMENTO DE VENDAS',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Center(child: Text('Nenhum dado de venda disponível.'))
            ]);
          }

          return FutureBuilder<List<Venda>>(
            future: AppDatabase().listarVendas(),
            builder: (context, vendaSnapshot) {
              if (vendaSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (vendaSnapshot.hasError) {
                return Center(
                  child:
                      Text('Erro ao carregar vendas: ${vendaSnapshot.error}'),
                );
              } else if (!vendaSnapshot.hasData ||
                  vendaSnapshot.data!.isEmpty) {
                return const Center(child: Text('Nenhuma venda realizada.'));
              }

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
          actions: [SwitchThemeApp()],
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

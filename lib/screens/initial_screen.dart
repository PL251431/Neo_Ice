import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/providers/riverpod.dart';
import 'package:neo_ice/screens/history_screen.dart';
import 'package:neo_ice/screens/products_screen.dart';
import 'package:neo_ice/screens/listar_vendas_page.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mode = ref.watch(lightMode);

    final List<Widget> screens = [
      const ListarProdutosPage(),
      const ListarVendasPage(),
      const HistoryScreen(),
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
                })
          ],
        ),
        body: screens[ref.watch(indexPage)],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
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
          currentIndex: ref.watch(indexPage),
          onTap: (index) {
            ref.read(indexPage.notifier).state = index;
          },
        ),
      ),
    );
  }
}

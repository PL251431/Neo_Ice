import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/riverpod.dart';
import 'package:neo_ice/screens/history_screen.dart';
import 'package:neo_ice/screens/products_screen.dart';
import 'package:neo_ice/screens/sale_add_screen.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mode = ref.watch(lightMode);

    final List<Widget> screens = [
      const ProductsScreen(),
      const SaleAddScreen(),
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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Vendas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Histórico',
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
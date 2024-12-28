import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InitialScreen(),
    );
  }
}

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Contador: '),
                    Text(ref.watch(counterProvider).toString()),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(counterProvider.notifier).state++;
                    },
                    child: const Text('mais')),
                ElevatedButton(
                    onPressed: () {
                      ref.read(counterProvider.notifier).state--;
                    },
                    child: const Text('menos'))
              ]),
        ),
      ),
    );
  }
}

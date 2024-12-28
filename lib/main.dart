import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Brightness brightness =
        ref.watch(lightMode) ? Brightness.light : Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: brightness),
      home: const InitialScreen(),
    );
  }
}

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mode = ref.watch(lightMode);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Neo Ice'),
        actions: [
          mode == true ? const Icon(Icons.sunny) : const Icon(Icons.dark_mode),
          Switch(
              value: mode,
              onChanged: (newMode) {
                ref.read(lightMode.notifier).state = newMode;
              })
        ],
      ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        ref.read(lightMode.notifier).state = true;
                      },
                      icon: const Icon(Icons.light_mode),
                      label: const Text('light mode'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        ref.read(lightMode.notifier).state = false;
                      },
                      icon: const Icon(Icons.dark_mode),
                      label: const Text('dark mode'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          ref.read(counterProvider.notifier).state++;
                        },
                        child: const Text('mais')),
                    ElevatedButton(
                        onPressed: () {
                          ref.read(counterProvider.notifier).state--;
                        },
                        child: const Text('menos')),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

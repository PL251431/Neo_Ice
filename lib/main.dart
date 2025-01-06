import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/providers/riverpod.dart';
import 'package:neo_ice/screens/initial_screen.dart';
import 'package:neo_ice/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeMode theme;
    theme = ref.watch(lightMode) ? ThemeMode.light : ThemeMode.dark;

    return MaterialApp(
      title: 'Neo Ice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: MaterialTheme.lightMediumContrastScheme()),
      darkTheme:
          ThemeData(colorScheme: MaterialTheme.darkMediumContrastScheme()),
      themeMode: theme,
      home: const InitialScreen(),
    );
  }
}

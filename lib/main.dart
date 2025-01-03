import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neo_ice/providers/riverpod.dart';
import 'package:neo_ice/screens/initial_screen.dart';

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
      title: 'Neo Ice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: brightness, textTheme: GoogleFonts.concertOneTextTheme()),
      home: const InitialScreen(),
    );
  }
}

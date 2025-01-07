import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neo_ice/providers/riverpod.dart';

class SwitchThemeApp extends ConsumerWidget {
  const SwitchThemeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightMode = ref.watch(lightModeProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isLightMode ? Icons.light_mode : Icons.dark_mode,
              size: 30,
            ),
            const SizedBox(width: 10),
            Switch(
              value: isLightMode,
              onChanged: (value) {
                ref.read(lightModeProvider.notifier).toggleTheme();
              },
            ),
          ],
        ),
      ],
    );
  }
}

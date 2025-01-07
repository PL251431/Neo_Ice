import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Provedor para verificar se o modo claro está ativado
final lightModeProvider = StateNotifierProvider<LightModeNotifier, bool>((ref) {
  return LightModeNotifier();
});

class LightModeNotifier extends StateNotifier<bool> {
  LightModeNotifier() : super(true) {
    _loadTheme();
  }

  // Carrega o tema salvo no Hive
  Future<void> _loadTheme() async {
    var box = await Hive.openBox('settings');
    bool savedTheme = box.get('themeMode', defaultValue: true);
    state = savedTheme;
  }

  // Alterna o tema e salva a escolha no Hive
  Future<void> toggleTheme() async {
    state = !state;
    var box = await Hive.openBox('settings');
    await box.put('themeMode', state);
  }
}


final indexPage = StateProvider<int>((ref) {
  return 0;
});

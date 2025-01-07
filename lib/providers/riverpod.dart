import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final lightModeProvider = StateNotifierProvider<LightModeNotifier, bool>((ref) {
  return LightModeNotifier();
});

class LightModeNotifier extends StateNotifier<bool> {
  LightModeNotifier() : super(true) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    var box = await Hive.openBox('settings');
    bool savedTheme = box.get('themeMode', defaultValue: true);
    state = savedTheme;
  }

  Future<void> toggleTheme() async {
    state = !state;
    var box = await Hive.openBox('settings');
    await box.put('themeMode', state);
  }
}

final indexPage = StateProvider<int>((ref) {
  return 0;
});

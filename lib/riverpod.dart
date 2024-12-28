import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definindo o provider para o contador
final counterProvider = StateProvider<int>((ref) {
  return 0;
});

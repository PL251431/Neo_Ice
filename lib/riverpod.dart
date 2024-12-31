import 'package:flutter_riverpod/flutter_riverpod.dart';

final lightMode = StateProvider<bool>((ref) {
  return true;
});

final indexPage = StateProvider<int>((ref) {
  return 0;
});

import 'package:riverpod/riverpod.dart';

final keywordProvider = StateProvider<String>((ref) {
  return '';
});

final isEditingProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});
import 'dart:isolate';

import 'package:code_check/provider/providers.dart';
import 'package:code_check/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingProvider);
    return Scaffold(
      appBar: AppBarForSearchPage(),
      body: isEditing
      ? const KeyWordPage()
      : const SearchedPage(),
    );
  }
}
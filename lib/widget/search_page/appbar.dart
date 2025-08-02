import 'package:code_check/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarForSearchPage extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const AppBarForSearchPage({super.key});
  @override
  ConsumerState<AppBarForSearchPage> createState() => _AppBarForSearchPageState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarForSearchPageState extends ConsumerState<AppBarForSearchPage> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        autofocus: true,
        onChanged: (value) => ref.read(keywordProvider.notifier).state = value,
        onTapOutside: (event) => ref.read(isEditingProvider.notifier).state = false,
        onSubmitted: (value) => value.isNotEmpty ? ref.read(isEditingProvider.notifier).state = false : null,
        onTap: () => ref.read(isEditingProvider.notifier).state = true,
      ),
    );
  }
}

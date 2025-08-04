import 'package:code_check/provider/providers.dart';
import 'package:code_check/service/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarForSearchPage extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AppBarForSearchPage({super.key});
  @override
  ConsumerState<AppBarForSearchPage> createState() =>
      _AppBarForSearchPageState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarForSearchPageState extends ConsumerState<AppBarForSearchPage> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          ref.read(keywordProvider.notifier).state = '';
          Navigator.pop(context);
        },
      ),
      title: TextField(
        autofocus: true,
        onChanged: (value) => ref.read(keywordProvider.notifier).state = value,
        onTapOutside: (event) =>
            ref.read(isEditingProvider.notifier).state = false,
        decoration: InputDecoration(
          hintText: 'キーワードを入力',
          border: InputBorder.none,
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            ref.read(isEditingProvider.notifier).state = false; //画面の切り替え
            ref.read(keywordProvider.notifier).state = value; //キーワードの更新
            ref.read(historyProvider.notifier).addKeyword(value); //履歴に追加
          }
        },
        onTap: () => ref.read(isEditingProvider.notifier).state = true,
      ),
    );
  }
}

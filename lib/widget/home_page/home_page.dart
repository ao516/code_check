import 'package:code_check/provider/providers.dart';
import 'package:code_check/router.dart';
import 'package:code_check/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return Scaffold(
      //appBar: AppBarForHomePage(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Githubリポジトリ検索アプリ',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
              ),
              onPressed: () => const SearchRoute().go(context),
              child: Row(
                children: [
                  Icon(
                    Icons.search
                  ),
                  const SizedBox(width: 10),
                  const Text('キーワードを入力'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
            child: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
    );
  }
}
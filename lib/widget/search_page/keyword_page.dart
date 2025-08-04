import 'package:code_check/provider/keyword.dart';
import 'package:code_check/service/history.dart';
import 'package:code_check/service/suggest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeyWordPage extends ConsumerWidget {
  const KeyWordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(historyProvider);

    return historyAsync.when(
      data: (data) =>
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('検索履歴'),
              const SizedBox(height: 8.0),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final keyword = data[index];
                    return ListTile(
                      title: Text(keyword),
                      onTap: () {
                        ref.read(keywordProvider.notifier).state = keyword;
                        ref.read(isEditingProvider.notifier).state = false;
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          ref.read(historyProvider.notifier).removeKeyword(keyword);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      error: (error, stack) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('データの取得に失敗しました。'),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(historyProvider);
              },
              child: const Text('再試行'),
            ),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
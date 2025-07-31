import 'package:code_check/service/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(searchedProvider);
    return Scaffold(
      appBar: AppBar(),
      body: asyncValue.when(
        data: (results) {
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final result = results[index];
              return ListTile(
                title: Text(result),
                onTap: () {
                  // Navigate to detail page
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

final searchedProvider = FutureProvider<List<String>>((ref) async {
  final response = await dio.get(
    'https://api.github.com/search/repositories?q=flutter',
  );
  debugPrint('SearchedProvider: ${response.data}');
  return (response.data['items'] as List).map((e) => e['name'] as String).toList();
});

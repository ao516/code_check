import 'package:code_check/router.dart';
import 'package:code_check/service/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchedPage extends ConsumerWidget {
  const SearchedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(searchedProvider);
    return asyncValue.when(
        data: (results) {
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final result = results[index];
              return ListTile(
                title: Text(result),
                onTap: () => context.push(RoutePathName.detail, extra: result),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
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

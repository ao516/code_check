import 'package:code_check/model/models.dart';
import 'package:code_check/provider/providers.dart';
import 'package:code_check/router.dart';
import 'package:code_check/service/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchedPage extends ConsumerWidget {
  const SearchedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyWord = ref.watch(keywordProvider);
    final asyncValue = ref.watch(searchedProvider(keyWord));
    return asyncValue.when(
        data: (results) {
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final result = results[index];
              return ListTile(
                title: Text(result.name),
                onTap: () => DetailRoute(path: result.path).push(context),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}

final searchedProvider = FutureProvider.family<List<Item>, String>((ref, keyword) async {
  final response = await dio.get(
    'https://api.github.com/search/repositories?q=$keyword',
  );
  debugPrint('SearchedProvider: ${response.data}');
  return (response.data['items'] as List).map((e) => Item(
    path: e['full_name'] as String,
    name: e['name'] as String,
  )).toList();
});
import 'package:code_check/model/models.dart';
import 'package:code_check/provider/providers.dart';
import 'package:code_check/router.dart';
import 'package:code_check/service/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

//検索結果一覧が表示されるページ
//特定のレポジトリを選択すると、詳細ページに遷移する
class SearchedPage extends ConsumerWidget {
  const SearchedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyWord = ref.watch(keywordProvider);
    final asyncValue = ref.watch(searchedProvider(keyWord));
    return asyncValue.when(
        data: (results) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('検索結果: ${results.length} 件ヒットしました。'),
                const SizedBox(height: 8.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final result = results[index];
                      return ListTile(
                        title: Text(result.name),
                        onTap: () => DetailRoute(path: result.path).push(context),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) {
          String message = '予期せぬエラーが発生しました。';
          if (error is DioException && error.type == DioExceptionType.connectionError) {
            message = 'インターネット接続エラーが発生しました。接続を確認してください。';
          } else if(error is DioException && error.type == DioExceptionType.badResponse) {
            message = 'Error: $error';
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(message)),
          );
        },
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
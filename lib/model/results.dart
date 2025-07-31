import 'package:code_check/service/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'results.freezed.dart';

part 'results.g.dart';

//検索結果のアイテムをタップしたら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示する
@freezed
abstract class Results with _$Results {
  const factory Results({
    required String name,
    required String owner,
    required String language,
    required int stars,
    required int watchers,
    required int forks,
    required int issues,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
}
final searchedProvider = FutureProvider<List<Results>>((ref) async {
  final response = await dio.get(
    'https://api.github.com/search/repositories?q=flutter',
  );
  debugPrint('SearchedProvider: ${response.data}');
  return response.data['items'].map((e) => e['name']).toList();
});
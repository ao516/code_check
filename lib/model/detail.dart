import 'package:code_check/service/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail.freezed.dart';

part 'detail.g.dart';

//該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示する
@freezed
abstract class Detail with _$Detail {
  const factory Detail({
    required String name,
    required List<String> language,
    @JsonKey(fromJson: _ownerFromJson) required String owner,
    @JsonKey(name: 'stargazers_count') required int stars,
    required int watchers,
    required int forks,
    @JsonKey(name: 'open_issues') required int issues,
  }) = _Detail;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}

String _ownerFromJson(Map<String, dynamic> owner) {
  return owner['avatar_url'] as String;
}

final detailProvider = FutureProvider.family<Detail, String>((ref, path) async {
  final response = await dio.get('https://api.github.com/repos/${path}');
  final languageResponse = await dio.get(
    'https://api.github.com/repos/${path}/languages',
  );

  debugPrint(
    'Type of languageResponse.data: ${languageResponse.data.runtimeType}',
  );
  debugPrint('Content of languageResponse.data: ${languageResponse.data}');

  final List<String> languageList = languageResponse.data.keys
      .whereType<String>().toList();
  final Map<String, dynamic> combinedData = {
    ...response.data,
    'language': languageList,
  };

  return Detail.fromJson(combinedData);
});

class Item {
  final String path;
  final String name;
  final bool isRead; //TODO: 未読・既読の処理

  Item({required this.path, required this.name, this.isRead = false});
}

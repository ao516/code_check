// import 'package:code_check/provider/providers.dart';
// import 'package:code_check/service/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final suggestProvider = FutureProvider<List<String>>((ref) async {
//   final query = ref.watch(keywordProvider);
//   final response = await dio.get('https://api.datamuse.com/sug', queryParameters: {'s': query});
//   debugPrint('Suggest API response: ${response.data}');
//   final List<String> list = (response.data as List)
//       .map((item) => item['word'] as String)
//       .toList();
//   return list;
// });
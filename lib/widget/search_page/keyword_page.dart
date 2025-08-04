import 'package:code_check/provider/keyword.dart';
import 'package:code_check/service/suggest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeyWordPage extends ConsumerWidget {
  const KeyWordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(child: Center(child: Text('キーワードを入力してください')),);
    // final asyncValue = ref.watch(suggestProvider);
    // return asyncValue.when(
    //   data: (suggestions) {
    //     return ListView.builder(
    //       itemCount: suggestions.length,
    //       itemBuilder: (context, index) {
    //         final suggestion = suggestions[index];
    //         return ListTile(
    //           title: Text(suggestion),
    //           onTap: () {
    //             ref.read(keywordProvider.notifier).state = suggestion;
    //             Navigator.pop(context);
    //           },
    //         );
    //       },
    //     );
    //   },
    //   loading: () => const Center(child: CircularProgressIndicator()),
    //   error: (error, stack) => Center(child: Text('Error: $error')),
    //);
  }
}
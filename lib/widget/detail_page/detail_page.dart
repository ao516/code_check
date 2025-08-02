import 'package:code_check/model/models.dart';
import 'package:code_check/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(detailProvider(path));
    return Scaffold(
      appBar: const AppBarForDetailPage(),
      body: Center(child: 
      asyncValue.when(
        data: (results) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: ${results}'),
              Text('Forks: ${results}'),
              // Add more details as needed
            ],
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text('Error: $error'),
      )),);
  }
}

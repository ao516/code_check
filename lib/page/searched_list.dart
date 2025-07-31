import 'package:code_check/model/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchedList extends ConsumerWidget {
  const SearchedList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchedAsyncValue = ref.watch(searchedProvider);
    return searchedAsyncValue.when(
      data: (results) {
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final result = results[index];
            return ListTile(
              title: Text(result.name),
              subtitle: Text('Owner: ${result.owner}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Stars: ${result.stars}'),
                  Text('Watchers: ${result.watchers}'),
                  Text('Forks: ${result.forks}'),
                  Text('Issues: ${result.issues}'),
                ],
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
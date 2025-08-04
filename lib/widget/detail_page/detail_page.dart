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
      body: Center(
        child: asyncValue.when(
          data: (results) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.network(results.owner, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              results.name,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              'GitHub Repository',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Languages',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8.0),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: results.language
                            .map(
                              (language) => Chip(
                                labelStyle: Theme.of(
                                  context,
                                ).textTheme.bodyMedium,
                                label: Text(language),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Statistics',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 2.5,
                        children: [
                          detailStatChip(
                            context: context,
                            icon: const Icon(Icons.star),
                            value: results.stars.toString(),
                          ),
                          detailStatChip(
                            context: context,
                            icon: const Icon(Icons.remove_red_eye),
                            value: results.watchers.toString(),
                          ),
                          detailStatChip(
                            context: context,
                            icon: const Icon(Icons.fork_right),
                            value: results.forks.toString(),
                          ),
                          detailStatChip(
                            context: context,
                            icon: const Icon(Icons.circle_outlined),
                            value: results.issues.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }

  Widget detailStatChip({
    required Icon icon,
    required String value,
    required BuildContext context,
  }) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 8.0),
          Text(value, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

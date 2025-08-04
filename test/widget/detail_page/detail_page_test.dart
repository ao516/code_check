import 'package:code_check/model/detail.dart';
import 'package:code_check/widget/detail_page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetailPage', () {
    const testPath = 'ao516/kenryo_tankyu';
    const mockDetail = Detail(
      name: 'Test Repository',
      language: ['Dart', 'Flutter'],
      owner: 'https://avatars.githubusercontent.com/u/80678583?v=4',
      stars: 100,
      watchers: 50,
      forks: 25,
      issues: 10,
    );

    testWidgets('should display repository details when data is loaded', (tester) async {
      final container = ProviderContainer(
        overrides: [
          detailProvider(testPath).overrideWith((ref) => mockDetail),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: DetailPage(path: testPath),
          ),
        ),
      );

      // Repository name should be displayed
      expect(find.text('Test Repository'), findsOneWidget);
      expect(find.text('GitHub Repository'), findsOneWidget);

      // Languages should be displayed as chips
      expect(find.text('Languages'), findsOneWidget);
      expect(find.text('Dart'), findsOneWidget);
      expect(find.text('Flutter'), findsOneWidget);

      // Statistics should be displayed
      expect(find.text('Statistics'), findsOneWidget);
      expect(find.text('Stars'), findsOneWidget);
      expect(find.text('100'), findsOneWidget);
      expect(find.text('Watchers'), findsOneWidget);
      expect(find.text('50'), findsOneWidget);
      expect(find.text('Forks'), findsOneWidget);
      expect(find.text('25'), findsOneWidget);
      expect(find.text('Issues'), findsOneWidget);
      expect(find.text('10'), findsOneWidget);

      // Owner avatar should be displayed
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should display loading indicator when data is loading', (tester) async {
      final container = ProviderContainer(
        overrides: [
          detailProvider(testPath).overrideWith((ref) async {
            await Future.delayed(const Duration(seconds: 1));
            throw UnimplementedError(); // Simulate loading by never returning a value
          }),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: DetailPage(path: testPath),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display error message when data loading fails', (tester) async {
      const errorMessage = 'Failed to load repository details';
      final container = ProviderContainer(
        overrides: [
          detailProvider(testPath).overrideWith((ref) => throw Exception(errorMessage)),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: DetailPage(path: testPath),
          ),
        ),
      );

      expect(find.text('Error: $errorMessage'), findsOneWidget);
    });

    testWidgets('should display all statistics chips correctly', (tester) async {
      final container = ProviderContainer(
        overrides: [
          detailProvider(testPath).overrideWith((ref) => mockDetail),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: DetailPage(path: testPath),
          ),
        ),
      );

      // Check all statistics chips
      final statsChips = find.byType(Chip);
      expect(statsChips, findsNWidgets(6)); // 2 language chips + 4 stats chips
    });

    testWidgets('should have proper layout structure', (tester) async {
      final container = ProviderContainer(
        overrides: [
          detailProvider(testPath).overrideWith((ref) => mockDetail),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: DetailPage(path: testPath),
          ),
        ),
      );

      // Check main structure
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Wrap), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });
  });
}

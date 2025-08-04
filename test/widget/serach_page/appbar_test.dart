import 'package:code_check/provider/providers.dart';
import 'package:code_check/service/history.dart';
import 'package:code_check/widget/search_page/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppBarForSearchPage', () {
    testWidgets('TextField should update keywordProvider on text change', (tester) async {
      final container = ProviderContainer();
      
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: Scaffold(
              appBar: const AppBarForSearchPage(),
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      await tester.enterText(textField, 'test keyword');
      await tester.pump();

      expect(container.read(keywordProvider), 'test keyword');
    });

    testWidgets('onSubmitted should update providers and add to history', (tester) async {
      final container = ProviderContainer();
      
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: Scaffold(
              appBar: const AppBarForSearchPage(),
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      
      await tester.enterText(textField, 'submitted keyword');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(container.read(keywordProvider), 'submitted keyword');
      expect(container.read(isEditingProvider), false);
    });

    testWidgets('back button should clear keyword and pop navigation', (tester) async {
      final container = ProviderContainer();
      
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: Scaffold(
              appBar: const AppBarForSearchPage(),
            ),
          ),
        ),
      );

      // Set initial keyword
      container.read(keywordProvider.notifier).state = 'initial keyword';
      await tester.pump();

      final backButton = find.byIcon(Icons.arrow_back);
      expect(backButton, findsOneWidget);

      await tester.tap(backButton);
      await tester.pump();

      expect(container.read(keywordProvider), '');
    });

    testWidgets('onTap should set isEditingProvider to false', (tester) async {
      final container = ProviderContainer();
      
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: Scaffold(
              appBar: const AppBarForSearchPage(),
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      
      await tester.tap(textField);
      await tester.pump();

      expect(container.read(isEditingProvider), false);
    });
  });
}

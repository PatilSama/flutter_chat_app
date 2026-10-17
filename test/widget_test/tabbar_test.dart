import 'package:chatapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreen Widget test', () {
    Future<void> createWidget(WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    }

    testWidgets('display All four tabs', (tester) async {
      await createWidget(tester);
      expect(find.byType(Tab), findsNWidgets(4));
    });
    testWidgets('initial tab index should be Chats', (tester) async {
      await createWidget(tester);
      final tabbar = tester.widget<TabBar>(find.byType(TabBar));
      expect(tabbar.controller?.length, 4);
      expect(tabbar.controller?.index, 1);
    });

    testWidgets('tap Calls tab', (WidgetTester tester) async {
      await createWidget(tester);

      await tester.tap(find.widgetWithText(Tab, 'CALLS'));
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(TabBarView),
          matching: find.text('CALLS'),
        ),
        findsOneWidget,
      );
      expect(find.text('CALLS').first, findsOneWidget);
      expect(find.text('CHATS').first, findsOneWidget);
    });

    testWidgets('Tap Status tab', (WidgetTester tester) async {
      await createWidget(tester);

      await tester.tap(find.widgetWithText(Tab, 'STATUS'));
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(TabBarView),
          matching: find.text('STATUS'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(TabBarView),
          matching: find.text('CALLS'),
        ),
        findsNothing,
      );
    });
  });
}

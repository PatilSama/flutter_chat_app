import 'package:chatapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Popup Menu Widget test', () {
    Future<void> createWidget(WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    }

    final menuOptions = [
      'New Group',
      'New Broadcast',
      'WhatsApp Web',
      'Starred Message',
      'Settings',
    ];

    testWidgets('Check PopupMenu Exist or not', (tester) async {
      await createWidget(tester);
      expect(find.byType(PopupMenuButton<String>), findsOneWidget);
    });

    testWidgets('Popup menu opens when tapped', (tester) async {
      await createWidget(tester);
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();
      expect(find.text('New Group'), findsOneWidget);
      expect(find.text('New Broadcast'), findsOneWidget);
    });

    testWidgets('All popup menu options are displayed', (tester) async {
      await createWidget(tester);
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();
      for (final option in menuOptions) {
        expect(find.text(option), findsOneWidget);
      }
    });
  });
}

import 'package:chatapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test Tab bar', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.byType(TabBarView), findsOneWidget);
    await tester.tap(find.widgetWithText(Tab, 'CHATS'));
    await tester.pumpAndSettle();

    expect(
      find.descendant(
        of: find.byType(TabBarView),
        matching: find.text('CHATS'),
      ),
      findsOneWidget,
    );
  });
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:AA1WhatsApp/features/auth/screan/ckeck_user.dart';
import 'package:AA1WhatsApp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);


    // Wait for the transition to the next screen
    await tester.pumpAndSettle(Duration(seconds: 3));  // Wait for 3 seconds for the transition

    // Verify that CheckUser screen is now displayed (replace this with actual widget check for CheckUser)
    expect(find.byType(CkeckUser), findsOneWidget);

  });
}

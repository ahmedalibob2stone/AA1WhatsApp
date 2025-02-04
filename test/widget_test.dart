// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:AA1WhatsApp/features/auth/screan/ckeck_user.dart';
import 'package:AA1WhatsApp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  testWidgets('SplashScreen transitions to CheckUser after delay', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Verify that the splash screen is showing correctly
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the transition to the next screen (3 seconds delay)
    await tester.pumpAndSettle(Duration(seconds: 5));

    // Verify that CheckUser screen is now displayed
    expect(find.byType(CheckUser), findsOneWidget); // صحيح هنا
 // Ensure the correct widget name is used here
  });

}

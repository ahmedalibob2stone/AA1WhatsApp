import 'package:AA1WhatsApp/features/auth/screan/ckeck_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:AA1WhatsApp/features/splash%20screan/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:AA1WhatsApp/firebase_options.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    try {
      // ✅ محاولة تهيئة Firebase مع التقاط أي أخطاء
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      print('✅ Firebase Initialized Successfully');
    } catch (e, stackTrace) {
      print('❌ Firebase Initialization Failed: $e');
      print(stackTrace);
    }
  });

  testWidgets('SplashScreen transitions to CheckUser after delay', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope( // ✅ إضافة ProviderScope هنا
        child: MaterialApp(home: SplashScreen()),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 4));

    expect(find.byType(CheckUser), findsOneWidget);
  });
}

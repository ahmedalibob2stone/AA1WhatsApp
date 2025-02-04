import 'package:AA1WhatsApp/features/auth/screan/ckeck_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:AA1WhatsApp/features/splash%20screan/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:AA1WhatsApp/firebase_options.dart';

void main() {
  setUpAll(() async {
    // ✅ تهيئة Firebase قبل تشغيل الاختبارات
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  });

  testWidgets('SplashScreen transitions to CheckUser after delay', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));

    // ✅ الانتظار لمدة 3 ثوانٍ لمحاكاة التأخير
    await tester.pumpAndSettle(const Duration(seconds: 4));

    // ✅ التحقق من الانتقال إلى CheckUser
    expect(find.byType(CheckUser), findsOneWidget);
  });
}

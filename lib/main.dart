import 'package:AA1WhatsApp/features/splash%20screan/splash_screen.dart';
import 'package:AA1WhatsApp/responsive/mobile_screen_Layout.dart';
import 'package:AA1WhatsApp/responsive/responsive.dart';
import 'package:AA1WhatsApp/responsive/web_screen_Layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:AA1WhatsApp/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'OnGenerateRoutes.dart';
import 'common/widgets/Error_Screan.dart';
import 'common/widgets/Loeading.dart';
import 'features/auth/viewmodel/auth_userviewmodel.dart';
import 'features/welcome/screans/landing_screan.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName:
      ".keystore");



  runApp(const ProviderScope(child:

  MyApp()

  ));



}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: OnGenerateRoutes.route,
      home:  SplashScreen()


    );
  }
}

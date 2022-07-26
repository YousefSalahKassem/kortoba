import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kortoba/modules/auth_controller.dart';
import 'package:kortoba/service/global/authentication_service.dart';
import 'package:kortoba/service/global/firebase_operations.dart';
import 'package:kortoba/styles/themes.dart';
import 'package:kortoba/util/globals.dart';
import 'package:kortoba/util/routes.dart';
import 'package:kortoba/view/Boarding/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'modules/boarding_controller.dart';
import 'util/firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => BoardingController(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthController(),
          ),
          ChangeNotifierProvider(
            create: (_) => FirebaseOperations(FirebaseFirestore.instance),
          ),
          ChangeNotifierProvider(
            create: (_) => FirebaseAuthenticationService(FirebaseAuth.instance),
          ),
    ],
      child: MaterialApp(
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            // Locale('en', 'US'),
            Locale('ar', 'AE'),
          ],
          title: 'Social Media',
          theme: AppThemes.lightTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          navigatorKey: Globals.instance.navigatorKey,
          onGenerateRoute: (settings) => AppRoute.onGenerateRoutes(settings),
          home: const SplashScreen()
      ),
    );
  }
}


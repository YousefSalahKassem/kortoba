import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kortoba/l10n/l10n.dart';
import 'package:kortoba/modules/auth_controller.dart';
import 'package:kortoba/modules/language_controller.dart';
import 'package:kortoba/modules/post_controller.dart';
import 'package:kortoba/service/global/authentication_service.dart';
import 'package:kortoba/service/global/firebase_operations.dart';
import 'package:kortoba/styles/themes.dart';
import 'package:kortoba/util/globals.dart';
import 'package:kortoba/util/routes.dart';
import 'package:kortoba/view/Boarding/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'modules/boarding_controller.dart';
import 'modules/favorite_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            create: (_) => FirebaseOperations(),
          ),
          ChangeNotifierProvider(
            create: (_) => FirebaseAuthenticationService(),
          ),
          ChangeNotifierProvider(
            create: (_) => PostController(),
          ),
          ChangeNotifierProvider(
              create: (_) => FavouriteController()
          ),
          ChangeNotifierProvider(
              create: (_) => ChangeLanguage()
          ),
    ],
      child: Consumer<ChangeLanguage>(
        builder:(context,provider,_){
          return MaterialApp(
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: L10n.all,
              locale: provider.appLocal,
              title: 'Social Media',
              theme: AppThemes.lightTheme,
              themeMode: ThemeMode.light,
              debugShowCheckedModeBanner: false,
              navigatorKey: Globals.instance.navigatorKey,
              onGenerateRoute: (settings) => AppRoute.onGenerateRoutes(settings),
              home: const SplashScreen()
          );
        }
      ),
    );
  }
}


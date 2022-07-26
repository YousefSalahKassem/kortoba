import 'package:firebase_auth/firebase_auth.dart';
import 'package:kortoba/util/routes.dart';
import 'package:kortoba/view/Boarding/screens/boarding_screen.dart';
import 'package:kortoba/view/Landing/screens/landing_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/Authentication/screens/login_screen.dart';

Future checkFirstSeen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = (prefs.getBool('seen') ?? false);

  if (seen && FirebaseAuth.instance.currentUser == null) {
    AppRoute.pushReplacement(const LoginScreen());
  }
  else if (seen && FirebaseAuth.instance.currentUser != null) {
    AppRoute.pushReplacement(const LandingScreen());
  }
  else {
    await prefs.setBool('seen', true);
    AppRoute.pushReplacement(const BoardingScreen());
  }
}
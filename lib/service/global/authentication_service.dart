import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kortoba/view/Landing/screens/landing_screen.dart';
import 'package:provider/provider.dart';
import '../../components/snack_bar.dart';
import '../../model/global/user_model.dart';
import '../../util/routes.dart';
import 'firebase_operations.dart';

class FirebaseAuthenticationService with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  User? get user => _firebaseAuth.currentUser;

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
    required String name
  }) async {
    try {
      _isLoading = true;
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        if(value.user != null){
          context.read<FirebaseOperations>().addUserData(
              context.read<FirebaseAuthenticationService>().user!.uid,
              UserModel(
                name: name,
                email: email,
                id: context.read<FirebaseAuthenticationService>().user!.uid,
                image: '',
                background: '',
              ));
          User user = value.user!;
          user.updateDisplayName(name);
          _isLoading=false;
          AppRoute.pushReplacement(const LandingScreen());
        }
      });
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      if (e.code == 'weak-password') {
      }
      else if (e.code == 'email-already-in-use') {
      }
    // Displaying the usual firebase error message
    }
    notifyListeners();
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      _isLoading = true;
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {
        if(value.user != null){
          _isLoading=false;
          AppRoute.pushReplacement(const LandingScreen());
        }
      });
    } on FirebaseAuthException catch (e) {
      _isLoading=false;
      showSnackBar(context, e.message!);
    }
    notifyListeners();
  }

  resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

}
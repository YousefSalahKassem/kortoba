import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kortoba/view/Landing/screens/landing_screen.dart';
import 'package:provider/provider.dart';
import '../../components/snack_bar.dart';
import '../../model/global/user_model.dart';
import '../../util/routes.dart';
import 'firebase_operations.dart';

class FirebaseAuthenticationService with ChangeNotifier {
  final FirebaseAuth _firebaseAuth ;
  FirebaseAuthenticationService(this._firebaseAuth);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  User? get user => _firebaseAuth.currentUser;

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

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
          _isLoading=false;
          AppRoute.pushReplacement(const LandingScreen());
          showSnackBar(context, 'Regitser successful');
        }
      });
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      if (e.code == 'weak-password') {
      }
      else if (e.code == 'email-already-in-use') {
      }
      showSnackBar(
          context, e.message!); // Displaying the usual firebase error message
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
          showSnackBar(context, 'Login successful');
        }
      });
    } on FirebaseAuthException catch (e) {
      _isLoading=false;
      showSnackBar(context, e.message!); // Displaying the error message
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
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

}
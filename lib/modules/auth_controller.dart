
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kortoba/model/global/user_model.dart';
import 'package:kortoba/service/global/authentication_service.dart';
import 'package:kortoba/service/global/firebase_operations.dart';
import 'package:kortoba/util/routes.dart';
import 'package:kortoba/view/Authentication/screens/login_screen.dart';
import 'package:provider/provider.dart';


class AuthController with ChangeNotifier{
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgotKey = GlobalKey<FormState>();

  bool _isShowing = true;
  bool get isShowing => _isShowing;

  UserModel _user= UserModel();
  UserModel get user => _user;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  AuthController(){
    loginKey;
    registerKey;
    forgotKey;
  }

  void show() {
    _isShowing = !_isShowing;
    notifyListeners();
  }

  void loginUser(BuildContext context) {
    context.read<FirebaseAuthenticationService>().loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
    notifyListeners();
  }

  void registerUser(BuildContext context) {
    context.read<FirebaseAuthenticationService>().signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context,
        name: '${firstNameController.text} ${lastNameController.text}'
    );
    notifyListeners();
  }

  void forgotPassword(BuildContext context) {
    context.read<FirebaseAuthenticationService>().resetPassword(
        email: emailController.text,
        context: context).whenComplete((){
      AppRoute.pushReplacement(const LoginScreen());
    });
    notifyListeners();
  }

  void logoutUser(BuildContext context) {
    context.read<FirebaseAuthenticationService>().signOut(context).whenComplete((){
      AppRoute.pushReplacement(const LoginScreen());
    });
    notifyListeners();
  }

  getCurrentUser(BuildContext context) async {
    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      _user = UserModel.fromJson(value.data()!);
    });
  }

  getUserData(BuildContext context, String uid) async {
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      _user = UserModel.fromJson(value.data()!);
    });
  }
}
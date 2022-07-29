import 'package:flutter/material.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import '../util/routes.dart';
import '../view/Authentication/screens/login_screen.dart';

class BoardingController with ChangeNotifier {
  int _currentIndex = 0;
  int _tapIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  int get currentIndex => _currentIndex;
  int get tapIndex => _tapIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
  set tapIndex(int value) {
    _tapIndex = value;
    notifyListeners();
  }

  void setCurrentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  void setTapIndex(int value) {
    _tapIndex = value;
    notifyListeners();
  }

  void nextPage(){
    if(currentIndex==2){
      AppRoute.pushReplacement(const LoginScreen());
    }
    else{
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
    notifyListeners();
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: context.height10,
      width: context.height30,
      margin: EdgeInsets.only(right: context.height10/2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.height20),
        color: currentIndex==index?secondaryColor:Colors.grey.withOpacity(.3),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/images.dart';
import '../model/local/boarding_model.dart';
import '../styles/strings.dart';
import '../util/routes.dart';
import '../view/Authentication/screens/login_screen.dart';

class BoardingController with ChangeNotifier {
  int _currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);



  int get currentIndex => _currentIndex;
  final List<Boarding> _boardings = [
    Boarding(
      title: welcome,
      image: splash1,
    ),
    Boarding(
      title: secondSplash,
      image: splash2,
    ),
    Boarding(
      title: thirdSplash,
      image: splash3,
    ),
  ];

  List<Boarding> get boardings => _boardings;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  void setCurrentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  void nextPage(){
    if(currentIndex==boardings.length-1){
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

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Strings {

  static String email = "Email";
  static String password = "Password";
  static String name = "UserName";
  static String login = "Login";

  static String tag1 = "Popular";
  static String tag2 = "Trending";
  static String tag3 = "Recent";
  static String drawerTitle2 = "View Profile";
  static String drawerTitle1 = "Sun Shibo";
  static String titleImageUrl =
      "https://img.js.design/assets/img/622ea99cfcdca67c5b4d1a37.png";
  // WelcomePage used
  static String welcomeTitle = "Welcome To DigiNews";
  static String loginFirst = "Continue with Email";
  static String loginSecond= "Continue with FaceBook";
  static String loginThird = "Continue with Google";
  static String loginValidity= "By continuing, you accept the Terms of Use and Privacy Policy";
  // LoginPage used
  static String loginTitle = "Welcome back!";
  static String loginTips = "Enter your email address and password to login";
  static String signupTitle = "Sign up";
  static String signupTips = "It only takes a minute to create your account";
  static String signup = "Create Account";
  static String toRegister = "Don’t have an account? Sign Up";
  static String toLogin = "Already registered? Login";
}

class ImageString{
  static String uri = "assets/images/1.0x/";
  static String logo = 'assets/images/logo.png';
  static String googleLogo = '${uri}google_icon.png';
  static String logo2 = '${uri}app_logo.png';
}


List<Map> drawerItems = [
  {'icon': Icons.home_outlined, 'title': "Home", 'selected': 1},
  {'icon': Icons.bookmark_add_outlined, 'title': "Saved News", 'selected': 0},
  {'icon': Icons.post_add_outlined, 'title': "Write News", 'selected': 0},
  {'icon': Icons.credit_card, 'title': "MemberShip", 'selected': 0},
  {'icon': Icons.help_outline, 'title': "Help", 'selected': 0},
  {'icon': Icons.person_outline_outlined, 'title': "Profile", 'selected': 0}
];

void drawerStatus(int index){
  for (int i = 0; i < drawerItems.length; i++) {
    drawerItems[i]['selected'] = 0;
  }
  drawerItems[index]['selected'] = 1;
}

var nowDrawerItem = drawerItems[0];
var nowDrawerCount = 0;

toast(String msg, BuildContext context){
  ///Set both animation and reverse animation,
  ///combination different animation and reverse animation to achieve amazing effect.
  showToast(msg,
    context: context,
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    position: StyledToastPosition.center,
    animDuration: const Duration(seconds: 1),
    duration: const Duration(seconds: 3),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
  );
}



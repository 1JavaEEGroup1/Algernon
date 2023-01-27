import 'package:flutter/material.dart';

class Strings {

  static String email = "Email";
  static String password = "Password";
  static String name = "Name";
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

var nowDrawerItem = drawerItems[0];
var nowDrawerCount = 0;

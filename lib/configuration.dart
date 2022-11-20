import 'package:flutter/material.dart';

class Strings {
  static String tag1 = "Popular";
  static String tag2 = "Trending";
  static String tag3 = "Recent";
  static String drawerTitle2 = "View Profile";
  static String drawerTitle1 = "Sun Shibo";
  static String titleImageUrl =
      "https://img.js.design/assets/img/622ea99cfcdca67c5b4d1a37.png";
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

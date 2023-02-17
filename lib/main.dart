
import 'package:algernon/ui/bookmarkScreen.dart';
import 'package:algernon/ui/detailScreen.dart';
import 'package:algernon/ui/drawerScreen.dart';
import 'package:algernon/ui/homeScreen.dart';
import 'package:algernon/ui/loginScreen.dart';
import 'package:algernon/ui/notificationScreen.dart';
import 'package:algernon/ui/splashScreen.dart';
import 'package:algernon/ui/welcomeScreen.dart';
import 'package:algernon/ui/writeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  runApp(MaterialApp(
    home: const SplashScreen(),
    navigatorKey: navigatorKey,
    routes: <String, WidgetBuilder>{
      '/login':(context) => const LoginScreen(),
      '/home' :(context) => const HomePage(),
      '/welcome':(context) => const WelcomeScreen(),
      '/notification' : (context) => const NotificationScreen(),
      '/saved': (context) => const SavedNewsScreen(),
      '/write': (context) => const WriteScreen()
    },
    onGenerateRoute: (RouteSettings settings){
      if(settings.name == "/detail"){
        final args = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => DetailScreen(newsId: args,));
      }
      return null;
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: const [DrawerScreen(), HomeScreen()],
      ),
    );
  }
}


import 'package:algernon/ui/drawerScreen.dart';
import 'package:algernon/ui/homeScreen.dart';
import 'package:algernon/ui/loginScreen.dart';
import 'package:algernon/ui/notificationScreen.dart';
import 'package:algernon/ui/splashScreen.dart';
import 'package:algernon/ui/welcomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/login':(BuildContext) => const LoginScreen(),
      '/home' :(BuildContext) => const HomePage(),
      '/welcome':(BuildContext) => const WelcomeScreen(),
      '/notification' : (BuildContext) => const NotificationScreen()
    },
    onGenerateRoute: (RouteSettings settings){

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


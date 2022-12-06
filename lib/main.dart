import 'package:algernon/ui/drawerScreen.dart';
import 'package:algernon/ui/homeScreen.dart';
import 'package:algernon/ui/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SplashScreen(),
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


import 'package:algernon/ui/drawerScreen.dart';
import 'package:algernon/ui/homeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
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


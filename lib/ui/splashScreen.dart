import 'package:algernon/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    build(context);
    startNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(ImageString.logo),
        )
      );
  }


  Future startNextPage() async{
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.of(context).pushReplacementNamed("/welcome");
  }
}

import 'package:algernon/configuration.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: logoAndSkip(),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget logoAndSkip() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(ImageString.logo, scale: 1.5,),
        const Text("Skip", style: TextStyle(fontSize: 16, color: Colors.red),),
      ],
    );
  }

}

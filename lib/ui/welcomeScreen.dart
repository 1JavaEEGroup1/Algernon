import 'package:algernon/configuration.dart';
import 'package:algernon/ui/loginScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: logoAndTitle(),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
                child: loginButtons(),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 40,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(Strings.loginValidity,
                  style:const TextStyle(color: Colors.black26, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40,)
            ],
          )
        ],
      ),
    );
  }

  Widget logoAndTitle() {
    return Column(
      children: [
        Row(children: [
          Image.asset(ImageString.logo2),
        ],),
        const SizedBox(height: 20,),
        Text(Strings.welcomeTitle, style: const TextStyle(color: Colors.black, fontSize: 40,),)
      ],
    );
  }

  Widget loginButtons() {
    return Column(
      children: [
        //Email
        MaterialButton(onPressed: ((){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }),
          height: 66,
          color: Colors.black,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Row(
            children: [
              const Icon(Icons.email, size: 30,color: Colors.white,),
              const SizedBox(width: 60,),
              Text(Strings.loginFirst, style: const TextStyle(fontSize: 20, color: Colors.white),)
            ],
          ),
        ),
        const SizedBox(height: 20,),
        // Facebook
        MaterialButton(onPressed: ((){

        }),
          height: 66,
          color: Colors.blue,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Row(
            children: [
              const Icon(Icons.facebook, size: 30,color: Colors.white,),
              const SizedBox(width: 50,),
              Text(Strings.loginSecond, style: const TextStyle(fontSize: 20, color: Colors.white),)
            ],
          ),
        ),
        const SizedBox(height: 20,),
        // Google
        MaterialButton(onPressed: ((){

        }),
          height: 66,
          color: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Row(
            children: [
              Image.asset(ImageString.googleLogo),
              const SizedBox(width: 60,),
              Text(Strings.loginThird, style: const TextStyle(fontSize: 20, color: Colors.black),)
            ],
          ),
        )
      ],
    );
  }

}

import 'package:algernon/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool login = true;
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userPassword = TextEditingController();
  final TextEditingController _userEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 0,
          ),
          Row(children: [
            IconButton(onPressed: ((){
              Navigator.pop(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              }), icon: const Icon(Icons.arrow_back))
          ],),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                login ? loginFragment(): signupFragment(),
              ],
            ),
          ),
          const SizedBox(height: 100,),
          Text(_userEmail.text + _userName.text + _userPassword.text),
          Container(
              margin: const EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
              child: loginAndChange(),)
        ],
      ),
    );
  }

  ///登录界面
  Widget loginFragment() {
    return Column(
      children: [
        Row(
          children: [
            Text(Strings.loginTitle,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ],
        ),
        const SizedBox(height: 20,),
        Text(Strings.loginTips,
          style:const TextStyle(color: Colors.black26, fontSize: 18),
        ),
        const SizedBox(height: 30,),
        // Email
        TextField(
          decoration: InputDecoration(
            labelText: Strings.email,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            hintText: "Your email address",
            hintStyle: const TextStyle(
                color: Colors.black26,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),
            filled: true,
            fillColor: Colors.grey[50],
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.red, //边框颜色为绿色
                  width: 1, //宽度为5
                )),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              )),
          ),
          keyboardType: TextInputType.emailAddress,
          controller: _userEmail
        ),
        const SizedBox(height: 20,),
        //Password
        TextField(
          decoration: InputDecoration(
            labelText: Strings.password,
            labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
            hintText: "Your password",
            hintStyle: const TextStyle(
                color: Colors.black26,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),
            counterText: "Forgot password",
            counterStyle: const TextStyle(
                color: Colors.redAccent,
                fontSize: 15,
            ),
            filled: true,
            fillColor: Colors.grey[50],
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.red, //边框颜色为绿色
                  width: 1, //宽度为5
                )),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                )),
          ),
          controller: _userPassword,
        ),
      ],
    );
  }

  ///注册界面
  Widget signupFragment() {
    return Column(
      children: [
        Row(
          children: [
            Text(Strings.signupTitle,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ],
        ),
        const SizedBox(height: 20,),
        Text(Strings.signupTips,
          style:const TextStyle(color: Colors.black26, fontSize: 18),
        ),
        const SizedBox(height: 30,),
        // UserName
        TextField(
          decoration: InputDecoration(
            labelText: Strings.name,
            labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
            hintText: "Your account name",
            hintStyle: const TextStyle(
                color: Colors.black26,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),
            filled: true,
            fillColor: Colors.grey[50],
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.red, //边框颜色为绿色
                  width: 1, //宽度为5
                )),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                )),
          ),
          controller: _userName,
        ),
        const SizedBox(height: 20,),
        // Email
        TextField(
          decoration: InputDecoration(
            labelText: Strings.email,
            labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
            hintText: "Your email address",
            hintStyle: const TextStyle(
                color: Colors.black26,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),
            filled: true,
            fillColor: Colors.grey[50],
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.red, //边框颜色为绿色
                  width: 1, //宽度为5
                )),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                )),
          ),
          keyboardType: TextInputType.emailAddress,
          controller: _userEmail,
        ),
        const SizedBox(height: 20,),
        //Password
        TextField(
          decoration: InputDecoration(
            labelText: Strings.password,
            labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
            hintText: "Your password",
            hintStyle: const TextStyle(
                color: Colors.black26,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),
            filled: true,
            fillColor: Colors.grey[50],
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.red, //边框颜色为绿色
                  width: 1, //宽度为5
                )),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                )),
          ),
          controller: _userPassword,
        ),
      ],
    );
  }

  Widget loginAndChange() {
    return Column(
      children: [
        MaterialButton(onPressed: ((){
            setState((){
              Navigator.of(context).pushNamed("/home");
            });
        }),
          height: 66,
          color: Colors.black,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(login? Strings.login : Strings.signup, style: const TextStyle(fontSize: 20, color: Colors.white),)
            ],
          ),
        ),
        const SizedBox(height: 10,),
        GestureDetector(
            onTap:(){
              setState((){
                login = !login;
              });
            },
            child:Text(login ? Strings.toRegister: Strings.toLogin , style:const TextStyle(color: Colors.black26, fontSize: 18),)
        )
      ],
    );
  }
}

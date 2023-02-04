import 'package:algernon/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Notification", style: TextStyle(color: Colors.black, fontSize: 24),),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) =>
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(ImageString.googleLogo, width: 57, height: 70,),
                  const SizedBox(width: 10,),
                  Expanded(child: textDetail(index)),
                  Image.asset(ImageString.googleLogo, width: 80, height: 80,)
                ],
              ),
            ),
            onTap: (){
              print("点击列表: $index");
            },
          ),
        separatorBuilder: (BuildContext context, int index) {
            return const Divider(thickness: 1, color: Colors.black26, indent: 24, endIndent: 24,);
        },
        itemCount: 20,
      ),
    );
  }

  textDetail(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        const Text("Title ccccccccccccccccccccccccccccccc", style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold
        )),
        const SizedBox(height: 10,),
        Text("$index days ago ", style: const TextStyle(
            color: Colors.black26,
            fontSize: 16,
        ),),
      ],
    );
  }
}

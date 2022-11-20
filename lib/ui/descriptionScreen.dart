import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  List<BoxShadow> listShadow = [
    const BoxShadow(
        color: Colors.black12,
        offset: Offset(1, 5),
        blurRadius: 12,
        spreadRadius: 10)
  ];

  String titleImageUrl =
      "https://img.js.design/assets/img/622ea99cfcdca67c5b4d1a37.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background view
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(titleImageUrl),
                        fit: BoxFit.fill,
                        repeat: ImageRepeat.noRepeat),
                    color: Colors.blue,
                  ),
                )),
                Expanded(
                    child: Container(
                  color: Colors.grey[50],
                ))
              ],
            ),
          ),
          //toolBar
          Container(
              margin: const EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.topCenter,
                child: toolBar(),
              )),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 120,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: listShadow),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: observeField(),
            ),
          )
        ],
      ),
    );
  }

  toolBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        Column(
          children: [
            IconButton(
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.comment_bank_outlined,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
      ],
    );
  }

  //评论栏
  observeField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                height: 60,
                child: Center(child: TextField()))),
        Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(left: 20, right: 30),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(30)),
          child: const Icon(
            Icons.send,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

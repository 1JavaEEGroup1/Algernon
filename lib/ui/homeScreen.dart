import 'dart:ui';

import 'package:algernon/configuration.dart';
import 'package:algernon/ui/descriptionScreen.dart';
import 'package:algernon/ui/detailScreen.dart';
import 'package:algernon/ui/widget/Banner.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isOpen = false;
  bool isFavoriate = false;

  late Animation animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isOpen ? -0.5 : 0),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isOpen ? 40 : 0.0)),
      child: NestedScrollView(
        body: listNews(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: Column(
                    children: [
                      titleBar(),
                      label(),
                    ],
                  )
              )
            )
          ];
        },
      ),
    );
  }

  //titleBar include icon back, search and notification
  Widget titleBar() {
    return Material(
      color: Colors.white,
      borderOnForeground: false,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///open or close drawer button
              isOpen
                  ? IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isOpen = false;
                      });
                    },
              )
                  : IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      setState(() {
                        xOffset = 230;
                        yOffset = 150;
                        scaleFactor = 0.7;
                        isOpen = true;
                      });
                    }),
              ///search and notification button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionScreen()));
                      }),
                  IconButton(
                      icon: const Icon(Icons.notifications_outlined),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/notification");
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool labelOnOne = true;
  bool labelOnTwo = false;
  bool labelOnThree = false;

  ///label
  label() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  labelOnOne = true;
                  labelOnTwo = labelOnThree = false;
                });
              },
              child: labelOnOne
                  ? Text(Strings.tag1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                  : Text(Strings.tag1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.grey))),
          GestureDetector(
              onTap: () {
                setState(() {
                  labelOnTwo = true;
                  labelOnOne = labelOnThree = false;
                });
              },
              child: labelOnTwo
                  ? Text(Strings.tag2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                  : Text(Strings.tag2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.grey))),
          GestureDetector(
              onTap: () {
                setState(() {
                  labelOnThree = true;
                  labelOnTwo = labelOnOne = false;
                });
              },
              child: labelOnThree
                  ? Text(Strings.tag3,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                  : Text(Strings.tag3,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.grey))),
        ],
      ),
    );
  }

  ///banner
  banner() {
    return BannerWidget(
      imageMargin: const EdgeInsets.symmetric(horizontal: 24),
      imageRadius: const BorderRadius.only(
        topLeft: Radius.circular(35),
        bottomRight: Radius.circular(35),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      imageList: [
        Strings.titleImageUrl,
        Strings.titleImageUrl,
        Strings.titleImageUrl
      ],
      onPageClicked: (index) {
        print("banner:  $index");
      },
      stringList: const [
        "This is the first banner",
        "This is the second banner",
        "This is the third banner",
      ],
    );
  }

  listNews() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: 20 ,
      itemBuilder: (context, index) =>(
          index == 0 ? banner():
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(ImageString.googleLogo, width: 96, height: 96,),
                  const SizedBox(width: 10,),
                  Expanded(child: textDetail(index) )
                ],
              ),
            ),
            onTap: (){
              print("点击主页列表: $index");
              // Navigator.of(context).pushNamed("/detail", arguments: index);
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailScreen(newsId: index)));
            },
          )
        ),
      separatorBuilder: (BuildContext context, int index) {
        if (index ==0) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                children: const [
                  SizedBox(width:20),
                  Text("Latest News", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                  // const Text("Update 1 minute ago", style: TextStyle(color: Colors.red, fontSize: 12)),
                ],
              ),
          );
        } else {
          return const Divider(thickness: 1, color: Colors.black26, indent: 24, endIndent: 24,);
        }
      },
    );
  }

  textDetail(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Category$index", style: const TextStyle(
            color: Colors.black26,
            fontSize: 14,
            fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 10,),
        const Text("Title ccccccccccccccccccccccccccccccc", style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
        )),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Time", style: TextStyle(
              color: Colors.black26,
              fontSize: 14,
            )),
            IconButton(
              icon: Icon(isFavoriate ? Icons.bookmark_added :Icons.bookmark_add_outlined, color: Colors.black26),
              onPressed: (){
                setState((){
                  isFavoriate = !isFavoriate;
                });
                print("收藏列表: $index");
              },
            )
          ],
        )
      ],
    );
  }
}

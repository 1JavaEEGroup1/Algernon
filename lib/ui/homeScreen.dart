import 'package:algernon/configuration.dart';
import 'package:algernon/ui/descriptionScreen.dart';
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

  late Animation animation;

  @override
  Widget build(BuildContext context) {
    // xOffset = MediaQuery.of(context).;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isOpen ? -0.5 : 0),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isOpen ? 40 : 0.0)),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: titleBar()),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: label(),
          ),
          Container(
            height: 354,
            width: 347,
            color: Colors.indigoAccent,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: banner(),
          ),
        ],
      ),
    );
  }

  //titleBar
  Widget titleBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //open or close drawer button
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
        //search and notification button
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
                onPressed: () {}),
          ],
        ),
      ],
    );
  }

  bool labelOnOne = true;
  bool labelOnTwo = false;
  bool labelOnThree = false;

  //label
  label() {
    return Row(
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
    );
  }

  banner() {
    return Stack();
  }

  list() {
    return Stack();
  }
}

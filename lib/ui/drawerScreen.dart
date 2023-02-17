import 'package:algernon/configuration.dart';
import 'package:algernon/data/db/dbCenter.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String username = "Miroslava Savitskaya";
  String email = "MemberShip";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 40, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [userTitle(), buttonList(), settingAndLogout()],
      ),
    );
  }


  @override
  initState() {
    final user = getUser();
    user.then((value){
      username = value.username!;
      email = value.email!;
      setState((){});
    });
  }

  userTitle() {
    return Row(
      children: [
        CircleAvatar(),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(username,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text(
              email,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11),
            )
          ],
        )
      ],
    );
  }

  buttonList() {
    return Column(
      children: drawerItems
          .map((element) => Padding(
                padding: const EdgeInsets.all(9.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (element['selected'] == 0) {
                        ///清空状态并赋予状态
                        for (int i = 0; i < drawerItems.length; i++) {
                          drawerItems[i]['selected'] = 0;
                          if (element == drawerItems[i]) {
                            nowDrawerItem = element;
                            nowDrawerCount = i;
                            element['selected'] = 1;
                          }
                        }
                        switch(nowDrawerCount){
                          case 1:
                            drawerStatus(0);
                            Navigator.of(context).pushNamed("/saved");

                        }
                      }
                    });
                  },
                  child: Row(
                    children: [
                      element['selected'] == 1
                          ? Icon(
                              element['icon'],
                              color: Colors.white,
                              size: 28,
                            )
                          : Icon(
                              element['icon'],
                              color: Colors.grey[700],
                              size: 28,
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      element['selected'] == 1
                          ? Text(element['title'],
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 20))
                          : Text(element['title'],
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 20))
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }

  settingAndLogout() {
    return Row(
      children: [
        GestureDetector(
          onTap: (() {}),
          child: Row(
            children: const [
              Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
              SizedBox(width: 5),
              Text("Setting",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 2,
          height: 20,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: (() {
            Navigator.of(context).pushReplacementNamed("/login");
          }),
          child: Row(
            children: const [
              Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              SizedBox(width: 5),
              Text("Log out",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        )
      ],
    );
  }
}

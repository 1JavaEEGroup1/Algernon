import 'package:algernon/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({Key? key}) : super(key: key);

  @override
  State<SavedNewsScreen> createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {
  bool isFavoriate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Bookmarks", style: TextStyle(color: Colors.black, fontSize: 24),),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black,), onPressed: () {  },
          )
        ],
        leading: BackButton(color: Colors.black,
          onPressed: (){
            Navigator.of(context).pop();
          }
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) =>
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(ImageString.googleLogo, width: 96, height: 96,),
                    const SizedBox(width: 10,),
                    Expanded(child: textDetail(index)),
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

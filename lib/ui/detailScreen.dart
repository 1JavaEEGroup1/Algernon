import 'package:algernon/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final int newsId;
  const DetailScreen({Key? key, required this.newsId}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        appBar(),
        SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => Text("index")
        ))
      ],
    );
  }

  appBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      // title: Text(widget.newsId.toString(), style: const TextStyle(color: Colors.black),),
      expandedHeight: 350,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          titlePadding: const EdgeInsets.all(16),
          background: titleBackground()
      ),
      leading: BackButton(
        color: Colors.black,
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(icon: const Icon(Icons.bookmark_add_outlined, color: Colors.black,), onPressed: (){},),
        IconButton(icon: const Icon(Icons.format_size, color: Colors.black,), onPressed: (){},),
        IconButton(icon: const Icon(Icons.share, color: Colors.black,), onPressed: (){},),
      ],
    );
  }

  titleBackground() {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(
          image: NetworkImage(Strings.titleImageUrl),
          fit: BoxFit.fill,
          repeat: ImageRepeat.noRepeat)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                const SizedBox(width: 20,),
                Column(
                  children: [
                    const SizedBox(height: 50,),
                    // IconButton(icon: const Icon(Icons.bookmark_add_outlined, color: Colors.black, size: 30,), onPressed: (){},),
                    // IconButton(icon: const Icon(Icons.format_size, color: Colors.black,size: 30,), onPressed: (){},),
                    // IconButton(icon: const Icon(Icons.share, color: Colors.black,size: 30,), onPressed: (){},),
                  ],
                )
            ],
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Here's What You Need To Know About Dumplings", style: TextStyle(fontSize: 25, color: Colors.black), maxLines: 2,),
              ),
              Row(children: [
                const SizedBox(width: 15,),
                Chip(label: Text("Category", style: const TextStyle(color: Colors.white),), backgroundColor: Colors.black26,),
                const SizedBox(width: 15,),
                Text("6 min read - 10 mins ago", style: const TextStyle(color: Colors.black))
              ],),
            ],
          )
        ],
      ),
    );
  }
}

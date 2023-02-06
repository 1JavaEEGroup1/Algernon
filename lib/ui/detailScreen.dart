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

  String title = "Here's What You Need To Know About Dumplings";
  String category = "Category";
  String issue_time = "6 min read - 10 mins ago";

  int comments = 99;
  int thumb_up = 634;
  String author = "Jean Prangley";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          appBar(),
          SliverToBoxAdapter(child: information(),),
          // content(),
          SliverList(delegate: SliverChildBuilderDelegate(
                  (context, index) => Text("bbbindex")
          ))
        ],
      ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(title, style: const TextStyle(fontSize: 25, color: Colors.black), maxLines: 2,),
              ),
              Row(children: [
                const SizedBox(width: 15,),
                Chip(label: Text(category, style: const TextStyle(color: Colors.black),), backgroundColor: Colors.black26,),
                const SizedBox(width: 15,),
                Text(issue_time, style: const TextStyle(color: Colors.black))
              ],),
            ],
          )
        ],
      ),
    );
  }

  information() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Chip(
              padding: const EdgeInsets.all(10),
              label: Text(author, style: TextStyle(fontSize: 14, color: Colors.white)),
              avatar: Image.asset(ImageString.googleLogo),
              backgroundColor: Colors.black,
              ),
            Chip(
              padding: const EdgeInsets.all(10),
              label: Text(thumb_up.toString(), style: const TextStyle(fontSize: 14, color: Colors.black)),
              avatar: const Icon(Icons.thumb_up_alt_outlined, size: 18),
              backgroundColor: Colors.black12,
            ),
            GestureDetector(
              onTap: (()async{
                final result = showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => DraggableScrollableSheet(
                        builder: (context, ScrollController controller){
                          return Container(
                            child: commentUI()
                          );
                        }
                    ));
                print("vvvv");
              }),
              child: Chip(
                padding: const EdgeInsets.all(10),
                label: Text(comments.toString(), style: const TextStyle(fontSize: 14, color: Colors.black)),
                avatar: const Icon(Icons.comment_outlined, size: 20),
                backgroundColor: Colors.black12,
              ),
            ),
          ],
        ),
      );
  }

  content() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const Text("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"),
    );
  }

  commentUI() {
  }
}

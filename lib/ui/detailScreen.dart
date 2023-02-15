
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

  String content = "T";

  @override
  void initState() {
    for(var i = 0; i< 1000 ; i++){
      content += "aaaaaaaaa";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          appBar(),
          SliverToBoxAdapter(child: information(),),
          // contents(),
          SliverList(
            
              delegate: SliverChildBuilderDelegate(
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
              label: Text(author, style: const TextStyle(fontSize: 14, color: Colors.white)),
              avatar: Image.asset(ImageString.googleLogo),
              backgroundColor: Colors.black,
              ),
            Chip(
              padding: const EdgeInsets.all(10),
              label: Text(thumb_up.toString(), style: const TextStyle(fontSize: 14, color: Colors.black)),
              avatar: const Icon(Icons.thumb_up_alt_outlined, size: 18),
              backgroundColor: Colors.black12,
            ),
            ///Comment Chip
            GestureDetector(
              onTap: (()async{
                final result = showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useRootNavigator: true,
                    enableDrag: false,
                    builder: (_) => DraggableScrollableSheet(
                      initialChildSize: 0.95,
                        expand: true,
                        builder: (context, ScrollController controller){
                          return commentUI();
                        }
                    ));
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

  contents() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const Text("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"),
    );
  }

  commentUI() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments", style: TextStyle(color: Colors.black, fontSize: 24),),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black,), onPressed: () {  },
          )
        ],
        leading: BackButton(color: Colors.black,
            onPressed: (){
                Navigator.pop(context);
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
                    Expanded(child: Text(index.toString())),
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
}

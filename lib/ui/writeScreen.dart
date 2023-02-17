
import 'package:algernon/configuration.dart';
import 'package:algernon/data/db/dbCenter.dart';
import 'package:algernon/data/db/fileCenter.dart';
import 'package:algernon/data/network/api/newsApi.dart';
import 'package:algernon/data/network/api/uploadApi.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({Key? key}) : super(key: key);

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _newsTitle = TextEditingController();
  final TextEditingController _newsContent = TextEditingController();
  String _coverLink = Strings.titleImageUrl;
  String _filepath = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 80,
        title: const Text(
          "Write News",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [IconButton(icon: const Icon(Icons.preview_outlined, color: Colors.deepOrangeAccent,), onPressed: (){},)],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            uploadCover(),
            writeContent(),
            topic(),
          ],
        ),
      ),
    );
  }

  uploadCover() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        Text(Strings.uploadCover, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10,),
        DottedBorder(
          color: Colors.black,
          strokeWidth: 1,
          radius: const Radius.circular(30),
          child: Stack(
            children:[
              Image.network(_coverLink),
              Container(
                  color: const Color.fromARGB(1, 232, 232, 232),
                  width: 350,
                  height: 150,
                  child: IconButton(icon: const Icon(Icons.cloud_upload_outlined, size: 50, color: Colors.black54, ),
                      onPressed: (){
                        var re = requestPermission([Permission.storage, Permission.manageExternalStorage]);
                        re.then((value) {
                          var filepath = getImage();
                          filepath.then((value) => setState((){
                            _filepath = value;
                          })).whenComplete(() =>{
                            toast("文件保存成功 + $_filepath", context),
                            uploadFile(_filepath, _filepath.replaceAll("/", "")).then((value) => {
                              toast(value.message!, context),
                              setState((){
                                  _coverLink = value.data!;
                              })
                            })
                          });
                        });
                      })
              ),
            ]
          )
        )
      ],
    );
  }

  writeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        Text(Strings.uploadTitle, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10,),
        TextField(
          maxLength: 50,
          cursorColor: Colors.black26,
          decoration: InputDecoration(
            hintText: "Write a Title",
            hintStyle: const TextStyle(
                color: Colors.black26,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),
            filled: true,
            fillColor: Colors.grey[50],
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Colors.grey[50]!, //边框颜色为绿色
                  width: 1, //宽度为5
                )),
            border: InputBorder.none
          ),
          controller: _newsTitle,
        ),
        Text(Strings.uploadContent, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10,),
        TextField(
          maxLength: 50,
          maxLines: 10,
          cursorColor: Colors.black26,
          decoration: InputDecoration(
              hintText: "Write something here",
              hintStyle: const TextStyle(
                  color: Colors.black26,
                  fontSize: 18,
                  fontStyle: FontStyle.italic
              ),
              filled: true,
              fillColor: Colors.grey[50],
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Colors.grey[50]!, //边框颜色为绿色
                    width: 1, //宽度为5
                  )),
              border: InputBorder.none
          ),
          controller: _newsContent,
        ),
      ],
    );
  }

  topic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Strings.uploadTopic, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10,),
        const Chip(label: Text("客户端"), deleteIcon: Icon(Icons.delete_outline),backgroundColor: Colors.black12,),
        const SizedBox(height: 10,),
        MaterialButton(onPressed: ((){
          logic();
        }),
          height: 66,
          color: Colors.black,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Publish", style: TextStyle(fontSize: 20, color: Colors.white),)
            ],
          ),
        ),
        const SizedBox(height: 15,),
      ],
    );
  }

  void logic() {
    getUser().then((value) => {
      addNews(_newsTitle.text, _newsContent.text, value.id!, 2, _coverLink).then((value) => {
        toast(value.message!, context)
      }).onError((error, stackTrace) => toast("消息上传失败", context))
      .whenComplete(() => Navigator.of(context).pop())
    });
    // toast(_filepath.replaceAll("/", " "), context);
  }
}

import 'package:algernon/data/entity/net/news.dart';
import 'package:algernon/data/network/netCenter.dart';
import 'package:dio/dio.dart';

Future<ResponseAddNews> addNews(String title, String content, int authorId, int topic, String url) async {
  print("addNews");
  topic = 2;
  Response response;
  response = await anotherDio.post('/new/add', data: {
    "title": title,
    "content": content,
    "author": authorId,
    "coverUrl":url,
    "topics": [
      topic
    ]
  });
  final result = ResponseAddNews.fromJson(response.data);
  return result;
}

Future<ResponseGetNews> getNews() async {
  print("getNews");
  Response response;
  response = await anotherDio.get(
    '/new/all',
  );
  final result = ResponseGetNews.fromJson(response.data);
  return result;
}
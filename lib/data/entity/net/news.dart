class ResponseAddNews {
  int? timestamp;
  String? status;
  String? message;
  Data? data;

  ResponseAddNews({this.timestamp, this.status, this.message, this.data});

  ResponseAddNews.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? coverUrl;
  String? title;
  String? content;
  DateTime? publishTime;
  Author? author;
  String? state;
  List<Topics>? topics;
  String? readNum;
  String? likeNum;
  String? comments;

  Data(
      {this.id,
        this.coverUrl,
        this.title,
        this.content,
        this.publishTime,
        this.author,
        this.state,
        this.topics,
        this.readNum,
        this.likeNum,
        this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coverUrl = json['coverUrl'];
    title = json['title'];
    content = json['content'];
    publishTime = json['publishTime'];
    author =
    json['author'] != null ? Author.fromJson(json['author']) : null;
    state = json['state'];
    if (json['topics'] != null) {
      topics = <Topics>[];
      json['topics'].forEach((v) {
        topics!.add(Topics.fromJson(v));
      });
    }
    readNum = json['readNum'];
    likeNum = json['likeNum'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['coverUrl'] = coverUrl;
    data['title'] = title;
    data['content'] = content;
    data['publishTime'] = publishTime;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['state'] = state;
    if (topics != null) {
      data['topics'] = topics!.map((v) => v.toJson()).toList();
    }
    data['readNum'] = readNum;
    data['likeNum'] = likeNum;
    data['comments'] = comments;
    return data;
  }
}

class Author {
  int? id;
  String? username;

  Author({this.id, this.username});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    return data;
  }
}

class Topics {
  int? id;

  Topics({this.id});

  Topics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

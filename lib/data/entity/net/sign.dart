//////////////////////siginup//////////////////////////
class ResponseSignup {
  int? timestamp;
  String? status;
  String? message;
  String? data;

  ResponseSignup({this.timestamp, this.status, this.message, this.data});

  ResponseSignup.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
//////////////////login//////////////////
class ResponseLogin {
  int? timestamp;
  String? status;
  String? message;
  Data? data;

  ResponseLogin({this.timestamp, this.status, this.message, this.data});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? username;
  List<String>? roles;

  Data({this.id, this.email, this.username, this.roles});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    data['roles'] = roles;
    return data;
  }
}



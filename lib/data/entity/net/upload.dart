class ResponseUploadFile {
  int? timestamp;
  String? status;
  String? message;
  String? data;

  ResponseUploadFile({this.timestamp, this.status, this.message, this.data});

  ResponseUploadFile.fromJson(Map<String, dynamic> json) {
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

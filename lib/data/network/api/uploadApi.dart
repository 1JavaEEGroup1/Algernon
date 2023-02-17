
import 'package:algernon/data/entity/net/upload.dart';
import 'package:algernon/data/network/netCenter.dart';
import 'package:dio/dio.dart';

Future<ResponseUploadFile> uploadFile(String path, String filename) async {
  print("UploadFile");
  final formData = FormData.fromMap({
    'name': "ddd",
    'date': DateTime.now().toIso8601String(),
    'file': await MultipartFile.fromFile(path, filename: filename),
  });
  Response response;
  response = await anotherDio.post('/common/uploadImage', data: formData);
  final result = ResponseUploadFile.fromJson(response.data);
  return result;
}

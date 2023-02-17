import 'package:algernon/data/entity/net/sign.dart';
import 'package:dio/dio.dart';

// Or create `Dio` with a `BaseOptions` instance.
final options = BaseOptions(
    baseUrl: 'http://114.132.251.197:8080/api',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    contentType: Headers.jsonContentType);
final anotherDio = Dio(options);

Future<ResponseSignup> requestSignup(String username, String email, String password) async {
  print("signup");
  Response response;
  response = await anotherDio.post('/auth/signup', data: {
    "username": username,
    "email": email,
    "password": password,
  });

  final result = ResponseSignup.fromJson(response.data);
  return result;
}

Future<ResponseLogin> requestLogin(String username, String password) async {
  print("signin");
  Response response;
  response = await anotherDio.post('/auth/signin', data: {
    "username": username,
    "password": password,
  });

  final result = ResponseLogin.fromJson(response.data);
  return result;
}

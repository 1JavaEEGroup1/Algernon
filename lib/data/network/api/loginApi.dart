import 'package:algernon/data/entity/net/sign.dart';
import 'package:algernon/data/network/netCenter.dart';
import 'package:dio/dio.dart';

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
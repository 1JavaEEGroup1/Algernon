import 'package:dio/dio.dart';

// Or create `Dio` with a `BaseOptions` instance.
final options = BaseOptions(
    baseUrl: 'http://114.132.251.197:8080/api',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    contentType: Headers.jsonContentType);
final anotherDio = Dio(options);


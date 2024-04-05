import 'package:dio/dio.dart';

Dio dioClient() {
  return Dio(BaseOptions(baseUrl: "http://192.168.138.112:4000"));
}

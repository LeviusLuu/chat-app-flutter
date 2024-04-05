import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'interceptors.dart';

Dio dioWithAuth() {
  return dioClient()..interceptors.addAll([DioInterceptor()]);
}

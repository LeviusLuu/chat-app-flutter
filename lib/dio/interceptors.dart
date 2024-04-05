import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dio_client.dart';

class DioInterceptor extends Interceptor {
  Dio dio = dioClient();

  FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await storage.read(key: "access_token");

    if (token == null) return;

    options.headers.addAll({
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await refreshTokenFunc();
      try {
        handler.resolve(await _retry(err.requestOptions));
      } on DioException catch (e) {
        return handler.next(e);
      }
      return;
    }

    return super.onError(err, handler);
  }

  Future<void> refreshTokenFunc() async {
    final refreshToken = await storage.read(key: 'refresh_token');
    final response = await dio
        .post('/auth/refresh-token', data: {'refreshToken': refreshToken});
    if (response.statusCode == 201) {
      await storage.write(
          key: "access_token", value: response.data["access_token"]);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    String? token = await storage.read(key: "access_token");

    final options = Options(
      method: requestOptions.method,
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}

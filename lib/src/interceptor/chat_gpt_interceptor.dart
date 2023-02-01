import 'package:dio/dio.dart';

class ChatGptInterceptor extends Interceptor {
  final String _apiKey;

  ChatGptInterceptor(this._apiKey);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = 'Bearer $_apiKey';
    options.headers.addEntries(
      [
        MapEntry<String, String>('Authorization', token),
        const MapEntry<String, String>('Content-Type', 'application/json'),
      ],
    );
    super.onRequest(options, handler);
  }
}

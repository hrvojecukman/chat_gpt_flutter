import 'dart:convert';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:chat_gpt_flutter/src/interceptor/chat_gpt_interceptor.dart';
import 'package:chat_gpt_flutter/src/transformers/stream_transformers.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const openAiBaseUrl = 'https://api.openai.com/v1';
const chatCompletionsEndPoint = '/chat/completions';

class ChatGpt {
  final String apiKey;

  ChatGpt({required this.apiKey});

  Future<AsyncCompletionResponse?> createChatCompletion(
    CompletionRequest request,
  ) async {
    final response = await dio.post(
      chatCompletionsEndPoint,
      data: json.encode(request.toJson()),
    );
    final data = response.data;
    if (data != null) {
      return AsyncCompletionResponse.fromJson(data);
    }
    return null;
  }

  Future<Stream<StreamCompletionResponse>?> createChatCompletionStream(
    CompletionRequest request,
  ) async {
    final response = await dio.post<ResponseBody>(
      chatCompletionsEndPoint,
      data: json.encode(request.toJson()),
      options: Options(
        headers: {
          "Accept": "text/event-stream",
          "Cache-Control": "no-cache",
        },
        responseType: ResponseType.stream,
      ),
    );

    final stream = response.data?.stream
        .transform(unit8Transformer)
        .transform(const Utf8Decoder())
        .transform(const LineSplitter())
        .transform(responseTransformer);

    return stream;
  }

  Dio get dio => Dio(BaseOptions(baseUrl: openAiBaseUrl))
    ..interceptors.addAll([
      ChatGptInterceptor(apiKey),
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    ]);
}

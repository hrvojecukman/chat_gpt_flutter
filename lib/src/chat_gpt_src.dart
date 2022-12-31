import 'dart:developer';

import 'package:chat_gpt/src/api/api_client.dart';
import 'package:chat_gpt/src/interceptor/chat_gpt_interceptor.dart';
import 'package:chat_gpt/src/models/completition_request.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const openAiBaseUrl = 'https://api.openai.com/v1';

class ChatGpt {
  final String apiKey;

  ChatGpt({required this.apiKey});

  Future<String?> createCompletion(CompletionRequest completionRequest) async {
    try {
      final apiClient = ApiClient(dio);
      final result = await apiClient.createCompletion(completionRequest);
      if (result.choices.isNotEmpty) {
        return result.choices.first.text.trim();
      }
      return null;
    } catch (err) {
      log("Error: $err");
      return null;
    }
  }

  Dio get dio => Dio(BaseOptions(baseUrl: openAiBaseUrl))
    ..interceptors.addAll([
      ChatGptInterceptor(apiKey),
      PrettyDioLogger(requestBody: true, requestHeader: true),
    ]);
}

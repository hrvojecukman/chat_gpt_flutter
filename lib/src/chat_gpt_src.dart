import 'dart:developer';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:chat_gpt_flutter/src/api/api_client.dart';
import 'package:chat_gpt_flutter/src/api/stram_api_client.dart';
import 'package:chat_gpt_flutter/src/interceptor/chat_gpt_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const openAiBaseUrl = 'https://api.openai.com/v1';

class ChatGpt {
  final String apiKey;

  ChatGpt({required this.apiKey});

  Future<String?> createCompletion(CompletionRequest completionRequest) async {
    try {
      final apiClient = ApiClient(buildDio());
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

  Future<Stream<CompletionResponse>?>? createStreamCompletion(
    CompletionRequest completionRequest,
  ) {
    try {
      final apiClient = StreamApiClient(buildDio(
        responseType: ResponseType.stream,
      ));
      return apiClient.onCompleteStream(completionRequest);
    } catch (err) {
      log("Error: $err");
      return null;
    }
  }

  Dio buildDio({ResponseType? responseType}) => Dio(BaseOptions(
        baseUrl: openAiBaseUrl,
        responseType: responseType,
      ))
        ..interceptors.addAll([
          ChatGptInterceptor(apiKey),
          PrettyDioLogger(
            requestBody: true,
            requestHeader: true,
            responseHeader: true,
          ),
        ]);
}

import 'dart:convert';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:chat_gpt_flutter/src/interceptor/chat_gpt_interceptor.dart';
import 'package:chat_gpt_flutter/src/models/image_edit_request.dart';
import 'package:chat_gpt_flutter/src/transformers/stream_transformers.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const openAiBaseUrl = 'https://api.openai.com/v1';
const chatCompletionsEndPoint = '/chat/completions';
const imageGenerationsEndPoint = '/images/generations';
const imageEditsEndPoint = '/images/edits';
const imageVariationsEndPoint = '/images/variations';

class ChatGpt {
  final String apiKey;
  final int? connectTimeout;
  final int? sendTimeout;
  final int? receiveTimeout;

  ChatGpt(
      {required this.apiKey,
      this.connectTimeout,
      this.sendTimeout,
      this.receiveTimeout});

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

  Future<ImageResponse?> createImage(
    CreateImageRequest request,
  ) async {
    final response = await dio.post(
      imageGenerationsEndPoint,
      data: json.encode(request.toJson()),
    );
    final data = response.data;
    if (data != null) {
      return ImageResponse.fromJson(data);
    }
    return null;
  }

  Future<ImageResponse?> createImageEdit(
    ImageEditRequest request,
  ) async {
    final response = await dio.post(
      imageEditsEndPoint,
      data: json.encode(request.toJson()),
    );
    final data = response.data;
    if (data != null) {
      return ImageResponse.fromJson(data);
    }
    return null;
  }

  Future<ImageResponse?> createImageVariation(
    ImageVariationRequest request,
  ) async {
    final formData = FormData.fromMap({
      'n': request.n,
      'size': request.size,
      'image': await MultipartFile.fromFile(request.image),
    });
    final response = await dio.post(imageVariationsEndPoint,
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}));
    final data = response.data;
    if (data != null) {
      return ImageResponse.fromJson(data);
    }
    return null;
  }

  Dio get dio => Dio(BaseOptions(
      baseUrl: openAiBaseUrl,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      connectTimeout: connectTimeout))
    ..interceptors.addAll([
      ChatGptInterceptor(apiKey),
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    ]);
}

import 'dart:convert';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:chat_gpt_flutter/src/interceptor/chat_gpt_interceptor.dart';
import 'package:chat_gpt_flutter/src/transformers/stream_transformers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:http/http.dart' as http;

const openAiBaseUrl = 'https://api.openai.com/v1';
const chatCompletionsEndPoint = '/chat/completions';
const imageGenerationsEndPoint = '/images/generations';
const imageEditsEndPoint = '/images/edits';
const imageVariationsEndPoint = '/images/variations';
const transcriptionsEndPoint = '/audio/transcriptions';

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

  Future<ImageResponse?> createImageVariation(
    ImageVariationRequest request,
  ) async {
    final formData = FormData.fromMap({
      'n': request.n,
      'size': request.size,
      'image': request.image != null
          ? await MultipartFile.fromFile(request.image ?? '')
          : MultipartFile.fromBytes(request.webImage?.toList() ?? [],
              filename: ''),
    });
    final response = await multipartDataDio.post(
      imageVariationsEndPoint,
      data: formData,
    );
    final data = response.data;
    if (data != null) {
      return ImageResponse.fromJson(data);
    }
    return null;
  }

  Future<TranscriptionResponse?> createTranscription(
    TranscriptionRequest request,
  ) async {
    final formData = FormData.fromMap({
      'file': kIsWeb
          ? await _createMultipartFileFromUrl(request.audioFilePath)
          : await MultipartFile.fromFile(request.audioFilePath),
      'model': request.model.modelName,
      'prompt': request.prompt,
      'language': request.language,
    });
    final response = await multipartDataDio.post(
      transcriptionsEndPoint,
      data: formData,
    );
    final data = response.data;
    if (data != null) {
      return TranscriptionResponse.fromJson(data);
    }
    return null;
  }

  Future<MultipartFile?> _createMultipartFileFromUrl(String url) async {
    try {
      final dio = Dio();
      final audioResponse = await dio.get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      String fileName = url.split('/').last;
      return MultipartFile.fromBytes(
          Uint8List.fromList(audioResponse.data).toList(),
          filename: fileName);
    } catch (e) {
      return null;
    }
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

  Dio get multipartDataDio =>
      dio..options.headers.addAll({'Content-Type': 'multipart/form-data'});
}

import 'dart:convert';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:chat_gpt_flutter/src/interceptor/chat_gpt_interceptor.dart';
import 'package:chat_gpt_flutter/src/transformers/stream_transformers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const openAiBaseUrl = 'https://api.openai.com/v1';
const chatCompletionsEndPoint = '/chat/completions';
const completionsEndPoint = '/completions';
const imageGenerationsEndPoint = '/images/generations';
const imageEditsEndPoint = '/images/edits';
const imageVariationsEndPoint = '/images/variations';
const transcriptionsEndPoint = '/audio/transcriptions';

/// Represents the main class for interacting with the ChatGPT API.
class ChatGpt {
  final String apiKey;
  final Duration? connectTimeout;
  final Duration? sendTimeout;
  final Duration? receiveTimeout;

  /// Constructs a [ChatGpt] instance.
  ///
  /// [apiKey] is required to authenticate with the API.
  /// [connectTimeout], [sendTimeout], and [receiveTimeout] are optional and represent the respective timeouts for the API calls.
  ChatGpt({
    required this.apiKey,
    this.connectTimeout,
    this.sendTimeout,
    this.receiveTimeout,
  });

  /// Creates a chat completion using the provided [request].
  ///
  /// Returns an [AsyncCompletionResponse] or null if the request fails.
  Future<AsyncCompletionResponse?> createChatCompletion(
    ChatCompletionRequest request,
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

  /// Creates a chat completion stream using the provided [request].
  ///
  /// Returns a stream of [StreamCompletionResponse] or null if the request fails.
  Future<Stream<StreamCompletionResponse>?> createChatCompletionStream(
    ChatCompletionRequest request,
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
        .transform(chatResponseTransformer);

    return stream;
  }

  /// Creates a completion stream using the provided [request].
  ///
  /// Returns a stream of [CompletionResponse] or null if the request fails.
  Future<Stream<CompletionResponse>?> createCompletionStream(
    CompletionRequest request,
  ) async {
    final response = await dio.post<ResponseBody>(
      completionsEndPoint,
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
        .transform(completionResponseTransformer);

    return stream;
  }

  /// Creates an image using the provided [request].
  ///
  /// Returns an [ImageResponse] or null if the request fails.
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

  /// Creates an image variation using the provided [request].
  ///
  /// Returns an [ImageResponse] or null if the request fails.
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

  /// Creates a transcription using the provided [request].
  ///
  /// Returns a [TranscriptionResponse] or null if the request fails.
  Future<TranscriptionResponse?> createTranscription(
    TranscriptionRequest request,
  ) async {
    final audioFilePath = request.audioFilePath;
    final formData = FormData.fromMap({
      'file': kIsWeb
          ? await _createMultipartFileFromUrl(
              url: audioFilePath,
              fileName: '${audioFilePath.split('/').last}.webm')
          : await MultipartFile.fromFile(audioFilePath),
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

  /// Helper method to create a [MultipartFile] from a given URL.
  ///
  /// Returns a [MultipartFile] or null if the operation fails.
  Future<MultipartFile?> _createMultipartFileFromUrl(
      {required String url, required String fileName}) async {
    try {
      Uint8List fileBytes = await http.readBytes(Uri.parse(url));
      return MultipartFile.fromBytes(fileBytes.toList(), filename: fileName);
    } catch (e) {
      return null;
    }
  }

  /// Returns a Dio instance with the base options set.
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

  /// Returns a Dio instance with headers set for multipart data.
  Dio get multipartDataDio => dio
    ..options.headers.addAll(
      {'Content-Type': 'multipart/form-data'},
    );
}

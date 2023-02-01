import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:dio/dio.dart';

const endOfStream = '[DONE]';

class StreamApiClient {
  final Dio dio;

  StreamApiClient(this.dio);

  Future<Stream<CompletionResponse>?> onCompleteStream(
    CompletionRequest request,
  ) async {
    return await _completeText(request);
  }

  final _completeControl = StreamController<CompletionResponse>.broadcast();

  Future<Stream<CompletionResponse>?> _completeText(
    CompletionRequest request,
  ) async {
    final response = await dio.post<ResponseBody>(
      "/completions",
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

  StreamTransformer<Uint8List, List<int>> unit8Transformer =
      StreamTransformer.fromHandlers(
    handleData: (data, sink) => sink.add(List<int>.from(data)),
  );

  StreamTransformer<String, CompletionResponse> responseTransformer =
      StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      if (data.isNotEmpty) {
        final jsonString = data.replaceAll('data: ', '');
        if (endOfStream != jsonString) {
          final json = jsonDecode(jsonString);
          sink.add(CompletionResponse.fromJson(json));
        }
      }
    },
  );

  void close() {
    _completeControl.close();
  }
}

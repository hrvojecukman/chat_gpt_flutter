import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:chat_gpt_flutter/src/models/completion_response.dart';
import 'package:chat_gpt_flutter/src/models/stream_completion_response.dart';

/// Constant representing the end of a stream.
const endOfStream = '[DONE]';

/// A [StreamTransformer] that transforms a stream of [Uint8List] into a stream of [List<int>].
///
/// This transformer is useful for converting byte data into a list of integers.
StreamTransformer<Uint8List, List<int>> unit8Transformer =
    StreamTransformer.fromHandlers(
  handleData: (data, sink) => sink.add(List<int>.from(data)),
);

/// A [StreamTransformer] that transforms a stream of [String] into a stream of [StreamCompletionResponse].
///
/// This transformer decodes the incoming string data, removes the 'data: ' prefix, and converts it into a [StreamCompletionResponse].
/// If the incoming data matches the [endOfStream] constant, it adds an end response to the sink.
StreamTransformer<String, StreamCompletionResponse> chatResponseTransformer =
    StreamTransformer.fromHandlers(
  handleData: (data, sink) {
    if (data.isNotEmpty) {
      final jsonString = data.replaceAll('data: ', '');
      if (endOfStream != jsonString) {
        final json = jsonDecode(jsonString);
        sink.add(StreamCompletionResponse.fromJson(json));
      } else {
        sink.add(StreamCompletionResponse.end());
      }
    }
  },
);

/// A [StreamTransformer] that transforms a stream of [String] into a stream of [CompletionResponse].
///
/// This transformer decodes the incoming string data, removes the 'data: ' prefix, and converts it into a [CompletionResponse].
/// If the incoming data matches the [endOfStream] constant, it adds an end response to the sink.
StreamTransformer<String, CompletionResponse> completionResponseTransformer =
    StreamTransformer.fromHandlers(
  handleData: (data, sink) {
    if (data.isNotEmpty) {
      final jsonString = data.replaceAll('data: ', '');
      if (endOfStream != jsonString) {
        final json = jsonDecode(jsonString);
        sink.add(CompletionResponse.fromJson(json));
      } else {
        sink.add(CompletionResponse.end());
      }
    }
  },
);

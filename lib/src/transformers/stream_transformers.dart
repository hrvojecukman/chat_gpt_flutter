import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';

const endOfStream = '[DONE]';

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
      } else {
        sink.add(CompletionResponse.end());
      }
    }
  },
);

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';

class TranscriptionRequest {
  final String audioFilePath;
  final ChatGptModel model;
  final String? prompt;
  final String? responseFormat;
  final String? language;

  TranscriptionRequest({
    required this.audioFilePath,
    this.model = ChatGptModel.whisper1,
    this.prompt,
    this.responseFormat,
    this.language,
  });
}

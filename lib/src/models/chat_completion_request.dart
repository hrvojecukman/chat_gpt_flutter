import 'package:chat_gpt_flutter/src/models/chat_gpt_model.dart';
import 'package:chat_gpt_flutter/src/models/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_completion_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChatCompletionRequest {
  final ChatGptModel model;
  final List<Message> messages;
  final double? temperature;
  final double? topP;
  final int? n;
  final bool? stream;
  final String? stop;
  final int?
      maxTokens; // max_tokens + messages tokens > 4096 will throw 400 error code

  ChatCompletionRequest({
    this.model = ChatGptModel.gpt4,
    required this.messages,
    this.temperature = 0,
    this.topP,
    this.n,
    this.stream,
    this.stop,
    this.maxTokens = 16,
  }) : assert(!(temperature != null && topP != null));

  factory ChatCompletionRequest.fromJson(Map<String, dynamic> data) =>
      _$ChatCompletionRequestFromJson(data);

  Map<String, dynamic> toJson() => _$ChatCompletionRequestToJson(this);
}

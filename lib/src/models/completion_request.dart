import 'package:chat_gpt_flutter/src/models/chat_gpt_model.dart';
import 'package:chat_gpt_flutter/src/models/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'completion_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CompletionRequest {
  final ChatGptModel model;
  final List<Message> messages;
  final double? temperature;
  final double? topP;
  final int? n;
  final bool? stream;
  final String? stop;
  final int? maxTokens; // max_tokens + messages tokens > 4096 will throw 400 error code

  CompletionRequest({
    this.model = ChatGptModel.gpt35Turbo,
    required this.messages,
    this.temperature = 0,
    this.topP,
    this.n,
    this.stream,
    this.stop,
    this.maxTokens = 16,
  }) : assert(!(temperature != null && topP != null));

  factory CompletionRequest.fromJson(Map<String, dynamic> data) =>
      _$CompletionRequestFromJson(data);

  Map<String, dynamic> toJson() => _$CompletionRequestToJson(this);
}

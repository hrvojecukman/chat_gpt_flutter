import 'package:chat_gpt_flutter/src/models/choices_response.dart';
import 'package:chat_gpt_flutter/src/models/usage_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'completion_response.g.dart';

/// [streamMessageEnd] will be set to true if the response is Stream and the data is "[DONE]"
@JsonSerializable(fieldRename: FieldRename.snake)
class CompletionResponse {
  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final List<ChoicesResponse>? choices;
  final UsageResponse? usage;
  final bool streamMessageEnd;

  CompletionResponse({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.usage,
    this.streamMessageEnd = false,
  });

  factory CompletionResponse.end() =>
      CompletionResponse(streamMessageEnd: true);

  factory CompletionResponse.fromJson(Map<String, dynamic> data) =>
      _$CompletionResponseFromJson(data);

  Map<String, dynamic> toJson() => _$CompletionResponseToJson(this);
}

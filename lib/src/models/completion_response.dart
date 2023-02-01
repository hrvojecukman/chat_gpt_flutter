import 'package:chat_gpt_flutter/src/models/choices_response.dart';
import 'package:chat_gpt_flutter/src/models/usage_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'completion_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CompletionResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<ChoicesResponse> choices;
  final UsageResponse? usage;

  CompletionResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory CompletionResponse.fromJson(Map<String, dynamic> data) =>
      _$CompletionResponseFromJson(data);

  Map<String, dynamic> toJson() => _$CompletionResponseToJson(this);
}

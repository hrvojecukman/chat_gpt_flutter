import 'package:chat_gpt/src/models/choices_response.dart';
import 'package:chat_gpt/src/models/usage_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'completition_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CompleteResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<ChoicesResponse> choices;
  final UsageResponse usage;

  CompleteResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory CompleteResponse.fromJson(Map<String, dynamic> data) =>
      _$CompleteResponseFromJson(data);

  Map<String, dynamic> toJson() => _$CompleteResponseToJson(this);
}

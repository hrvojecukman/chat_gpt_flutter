import 'package:json_annotation/json_annotation.dart';

part 'completition_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CompletionRequest {
  final String model;
  final String? prompt;
  final int? maxTokens;
  final double? temperature;
  final double? topP;
  final int? n;

  CompletionRequest({
    required this.model,
    required this.prompt,
    this.temperature = 0,
    this.maxTokens = 16,
    this.topP,
    this.n = 1,
  }) : assert(!(temperature != null && topP != null));

  factory CompletionRequest.fromJson(Map<String, dynamic> data) =>
      _$CompletionRequestFromJson(data);

  Map<String, dynamic> toJson() => _$CompletionRequestToJson(this);
}

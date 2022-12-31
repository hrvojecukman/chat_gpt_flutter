import 'package:json_annotation/json_annotation.dart';

part 'usage_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UsageResponse {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  UsageResponse({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory UsageResponse.fromJson(Map<String, dynamic> data) =>
      _$UsageResponseFromJson(data);

  Map<String, dynamic> toJson() => _$UsageResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'choices_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChoicesResponse {
  final String text;
  final int index;
  final int? logprobs;
  final String finishReason;

  ChoicesResponse({
    required this.text,
    required this.index,
    this.logprobs,
    required this.finishReason,
  });

  factory ChoicesResponse.fromJson(Map<String, dynamic> data) =>
      _$ChoicesResponseFromJson(data);

  Map<String, dynamic> toJson() => _$ChoicesResponseToJson(this);
}

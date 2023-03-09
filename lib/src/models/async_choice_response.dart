import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'async_choice_response.g.dart';

/// use it in [AsyncCompletionResponse]
@JsonSerializable(fieldRename: FieldRename.snake)
class AsyncChoiceResponse {
  final Message? message;
  final String? finishReason;
  final int index;

  AsyncChoiceResponse({
    this.message,
    this.finishReason,
    required this.index,
  });

  factory AsyncChoiceResponse.fromJson(Map<String, dynamic> data) =>
      _$AsyncChoiceResponseFromJson(data);

  Map<String, dynamic> toJson() => _$AsyncChoiceResponseToJson(this);
}

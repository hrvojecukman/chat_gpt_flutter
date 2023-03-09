import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:chat_gpt_flutter/src/models/delta_response.dart';
import 'package:chat_gpt_flutter/src/models/stream_completion_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stream_choice_response.g.dart';

/// use it in [StreamCompletionResponse]
@JsonSerializable(fieldRename: FieldRename.snake)
class StreamChoiceResponse {
  final DeltaResponse? delta;
  final String? finishReason;
  final int index;

  StreamChoiceResponse({
    this.delta,
    this.finishReason,
    required this.index,
  });

  factory StreamChoiceResponse.fromJson(Map<String, dynamic> data) =>
      _$StreamChoiceResponseFromJson(data);

  Map<String, dynamic> toJson() => _$StreamChoiceResponseToJson(this);
}

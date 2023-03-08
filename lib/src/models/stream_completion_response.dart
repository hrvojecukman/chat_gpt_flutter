import 'package:chat_gpt_flutter/src/models/stream_choice_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stream_completion_response.g.dart';

/// [streamMessageEnd] will be set to true if the response is Stream and the data is "[DONE]"
@JsonSerializable(fieldRename: FieldRename.snake)
class StreamCompletionResponse {
  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final List<StreamChoiceResponse>? choices;
  final bool streamMessageEnd;

  StreamCompletionResponse({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.streamMessageEnd = false,
  });

  factory StreamCompletionResponse.end() =>
      StreamCompletionResponse(streamMessageEnd: true);

  factory StreamCompletionResponse.fromJson(Map<String, dynamic> data) =>
      _$StreamCompletionResponseFromJson(data);

  Map<String, dynamic> toJson() => _$StreamCompletionResponseToJson(this);
}

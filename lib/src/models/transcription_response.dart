import 'package:json_annotation/json_annotation.dart';

part 'transcription_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TranscriptionResponse {
  final String text;

  TranscriptionResponse({required this.text});

  factory TranscriptionResponse.fromJson(Map<String, dynamic> data) =>
      _$TranscriptionResponseFromJson(data);

  Map<String, dynamic> toJson() => _$TranscriptionResponseToJson(this);
}

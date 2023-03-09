import 'package:json_annotation/json_annotation.dart';

part 'delta_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DeltaResponse {
  final String content;

  DeltaResponse({
    this.content = '',
  });

  factory DeltaResponse.fromJson(Map<String, dynamic> data) =>
      _$DeltaResponseFromJson(data);

  Map<String, dynamic> toJson() => _$DeltaResponseToJson(this);
}

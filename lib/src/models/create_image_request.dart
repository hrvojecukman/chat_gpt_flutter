import 'package:json_annotation/json_annotation.dart';

part 'create_image_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreateImageRequest {
  final String prompt;
  final int? n;
  final String? size;
  final String? responseFormat;

  CreateImageRequest({
    required this.prompt,
    this.n,
    this.size,
    this.responseFormat = 'url',
  });

  factory CreateImageRequest.fromJson(Map<String, dynamic> data) =>
      _$CreateImageRequestFromJson(data);

  Map<String, dynamic> toJson() => _$CreateImageRequestToJson(this);
}

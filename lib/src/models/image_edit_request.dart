import 'package:json_annotation/json_annotation.dart';

part 'image_edit_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageEditRequest {
  final String image;
  final String? mask;
  final String prompt;
  final int? n;
  final String? size;
  final String? responseFormat;
  final String? user;

  ImageEditRequest({
    required this.image,
    this.mask,
    required this.prompt,
    this.n,
    this.size,
    this.responseFormat,
    this.user,
  });

  factory ImageEditRequest.fromJson(Map<String, dynamic> data) =>
      _$ImageEditRequestFromJson(data);

  Map<String, dynamic> toJson() => _$ImageEditRequestToJson(this);
}

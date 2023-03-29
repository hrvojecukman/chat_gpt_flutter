import 'package:json_annotation/json_annotation.dart';

part 'image_variation_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageVariationRequest {
  final String image;
  final int? n;
  final String? size;
  final String? responseFormat;
  final String? user;

  ImageVariationRequest({
    required this.image,
    this.n,
    this.size,
    this.responseFormat,
    this.user,
  });

  factory ImageVariationRequest.fromJson(Map<String, dynamic> data) =>
      _$ImageVariationRequestFromJson(data);

  Map<String, dynamic> toJson() => _$ImageVariationRequestToJson(this);
}

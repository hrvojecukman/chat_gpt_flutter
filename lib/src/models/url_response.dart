import 'package:json_annotation/json_annotation.dart';

part 'url_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UrlResponse {
  final String? url;

  UrlResponse({
    this.url,
  });

  factory UrlResponse.fromJson(Map<String, dynamic> data) =>
      _$UrlResponseFromJson(data);

  Map<String, dynamic> toJson() => _$UrlResponseToJson(this);
}

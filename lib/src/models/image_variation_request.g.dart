// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_variation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageVariationRequest _$ImageVariationRequestFromJson(
        Map<String, dynamic> json) =>
    ImageVariationRequest(
      image: json['image'] as String,
      n: json['n'] as int?,
      size: json['size'] as String?,
      responseFormat: json['response_format'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$ImageVariationRequestToJson(
        ImageVariationRequest instance) =>
    <String, dynamic>{
      'image': instance.image,
      'n': instance.n,
      'size': instance.size,
      'response_format': instance.responseFormat,
      'user': instance.user,
    };

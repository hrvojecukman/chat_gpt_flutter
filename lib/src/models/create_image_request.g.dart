// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_image_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateImageRequest _$CreateImageRequestFromJson(Map<String, dynamic> json) =>
    CreateImageRequest(
      prompt: json['prompt'] as String,
      n: json['n'] as int?,
      size: json['size'] as String?,
      responseFormat: json['response_format'] as String? ?? 'url',
    );

Map<String, dynamic> _$CreateImageRequestToJson(CreateImageRequest instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'n': instance.n,
      'size': instance.size,
      'response_format': instance.responseFormat,
    };

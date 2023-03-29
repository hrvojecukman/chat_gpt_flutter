// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_edit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageEditRequest _$ImageEditRequestFromJson(Map<String, dynamic> json) =>
    ImageEditRequest(
      image: json['image'] as String,
      mask: json['mask'] as String?,
      prompt: json['prompt'] as String,
      n: json['n'] as int?,
      size: json['size'] as String?,
      responseFormat: json['response_format'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$ImageEditRequestToJson(ImageEditRequest instance) =>
    <String, dynamic>{
      'image': instance.image,
      'mask': instance.mask,
      'prompt': instance.prompt,
      'n': instance.n,
      'size': instance.size,
      'response_format': instance.responseFormat,
      'user': instance.user,
    };

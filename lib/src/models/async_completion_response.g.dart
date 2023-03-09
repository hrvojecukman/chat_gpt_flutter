// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'async_completion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsyncCompletionResponse _$AsyncCompletionResponseFromJson(
        Map<String, dynamic> json) =>
    AsyncCompletionResponse(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      model: json['model'] as String?,
      usage: json['usage'] == null
          ? null
          : UsageResponse.fromJson(json['usage'] as Map<String, dynamic>),
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => AsyncChoiceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AsyncCompletionResponseToJson(
        AsyncCompletionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'usage': instance.usage,
      'choices': instance.choices,
    };

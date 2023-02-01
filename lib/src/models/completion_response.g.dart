// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletionResponse _$CompleteResponseFromJson(Map<String, dynamic> json) =>
    CompletionResponse(
      id: json['id'] as String,
      object: json['object'] as String,
      created: json['created'] as int,
      model: json['model'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => ChoicesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: json['usage'] == null
          ? null
          : UsageResponse.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompleteResponseToJson(CompletionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
      'usage': instance.usage,
    };

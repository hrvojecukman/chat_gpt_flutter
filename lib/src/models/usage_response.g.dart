// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usage_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsageResponse _$UsageResponseFromJson(Map<String, dynamic> json) =>
    UsageResponse(
      promptTokens: json['prompt_tokens'] as int,
      completionTokens: json['completion_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$UsageResponseToJson(UsageResponse instance) =>
    <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
    };

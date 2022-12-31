// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completition_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletionRequest _$CompletionRequestFromJson(Map<String, dynamic> json) =>
    CompletionRequest(
      model: json['model'] as String,
      prompt: json['prompt'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0,
      maxTokens: json['max_tokens'] as int? ?? 16,
      topP: (json['top_p'] as num?)?.toDouble(),
      n: json['n'] as int? ?? 1,
    );

Map<String, dynamic> _$CompletionRequestToJson(CompletionRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'prompt': instance.prompt,
      'max_tokens': instance.maxTokens,
      'temperature': instance.temperature,
      'top_p': instance.topP,
      'n': instance.n,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletionRequest _$CompletionRequestFromJson(Map<String, dynamic> json) =>
    CompletionRequest(
      model: json['model'] as String,
      prompt:
          (json['prompt'] as List<dynamic>?)?.map((e) => e as String).toList(),
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0,
      maxTokens: json['max_tokens'] as int? ?? 16,
      topP: (json['top_p'] as num?)?.toDouble(),
      n: json['n'] as int? ?? 1,
      stream: json['stream'] as bool?,
      stop: (json['stop'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CompletionRequestToJson(CompletionRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'prompt': instance.prompt,
      'max_tokens': instance.maxTokens,
      'temperature': instance.temperature,
      'top_p': instance.topP,
      'n': instance.n,
      'stream': instance.stream,
      'stop': instance.stop,
    };

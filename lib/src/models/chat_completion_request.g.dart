// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_completion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatCompletionRequest _$ChatCompletionRequestFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionRequest(
      model: json['model'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0,
      topP: (json['top_p'] as num?)?.toDouble(),
      n: json['n'] as int?,
      stream: json['stream'] as bool?,
      stop: json['stop'] as String?,
      maxTokens: json['max_tokens'] as int? ?? 16,
    );

Map<String, dynamic> _$ChatCompletionRequestToJson(
        ChatCompletionRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages,
      'temperature': instance.temperature,
      'top_p': instance.topP,
      'n': instance.n,
      'stream': instance.stream,
      'stop': instance.stop,
      'max_tokens': instance.maxTokens,
    };

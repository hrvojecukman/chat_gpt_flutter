// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletionRequest _$CompletionRequestFromJson(Map<String, dynamic> json) =>
    CompletionRequest(
      model: $enumDecodeNullable(_$ChatGptModelEnumMap, json['model']) ??
          ChatGptModel.textDavinci003,
      prompt:
          (json['prompt'] as List<dynamic>?)?.map((e) => e as String).toList(),
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0,
      maxTokens: json['max_tokens'] as int? ?? 16,
      topP: (json['top_p'] as num?)?.toDouble(),
      n: json['n'] as int? ?? 1,
      stream: json['stream'] as bool?,
    );

Map<String, dynamic> _$CompletionRequestToJson(CompletionRequest instance) =>
    <String, dynamic>{
      'model': _$ChatGptModelEnumMap[instance.model]!,
      'prompt': instance.prompt,
      'max_tokens': instance.maxTokens,
      'temperature': instance.temperature,
      'top_p': instance.topP,
      'n': instance.n,
      'stream': instance.stream,
    };

const _$ChatGptModelEnumMap = {
  ChatGptModel.babbage: 'babbage',
  ChatGptModel.textBabbage001: 'text-babbage-001',
  ChatGptModel.ada: 'ada',
  ChatGptModel.textAda001: 'text-ada-001',
  ChatGptModel.davinci: 'davinci',
  ChatGptModel.textDavinci001: 'text-davinci-001',
  ChatGptModel.textDavinci002: 'text-davinci-002',
  ChatGptModel.textDavinci003: 'text-davinci-003',
  ChatGptModel.codeDavinci002: 'code-davinci-002',
  ChatGptModel.davinciInstructBeta: 'davinci-instruct-beta',
  ChatGptModel.curieInstructBeta: 'curie-instruct-beta',
  ChatGptModel.codeCushman001: 'code-cushman-001',
  ChatGptModel.curie: 'curie',
  ChatGptModel.textCurie001: 'text-curie-001',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletionRequest _$CompletionRequestFromJson(Map<String, dynamic> json) =>
    CompletionRequest(
      model: $enumDecodeNullable(_$ChatGptModelEnumMap, json['model']) ??
          ChatGptModel.gpt4,
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

Map<String, dynamic> _$CompletionRequestToJson(CompletionRequest instance) =>
    <String, dynamic>{
      'model': _$ChatGptModelEnumMap[instance.model]!,
      'messages': instance.messages,
      'temperature': instance.temperature,
      'top_p': instance.topP,
      'n': instance.n,
      'stream': instance.stream,
      'stop': instance.stop,
      'max_tokens': instance.maxTokens,
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
  ChatGptModel.gpt35Turbo: 'gpt-3.5-turbo',
  ChatGptModel.gpt35Turbo0301: 'gpt-3.5-turbo-0301',
  ChatGptModel.gpt4: 'gpt-4',
  ChatGptModel.gpt40314: 'gpt-4-0314',
};

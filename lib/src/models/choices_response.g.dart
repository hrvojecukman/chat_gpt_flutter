// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChoicesResponse _$ChoicesResponseFromJson(Map<String, dynamic> json) =>
    ChoicesResponse(
      text: json['text'] as String,
      index: json['index'] as int,
      logprobs: json['logprobs'] as int?,
      finishReason: json['finish_reason'] as String,
    );

Map<String, dynamic> _$ChoicesResponseToJson(ChoicesResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'index': instance.index,
      'logprobs': instance.logprobs,
      'finish_reason': instance.finishReason,
    };

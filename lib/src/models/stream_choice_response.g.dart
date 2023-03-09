// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_choice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamChoiceResponse _$StreamChoiceResponseFromJson(
        Map<String, dynamic> json) =>
    StreamChoiceResponse(
      delta: json['delta'] == null
          ? null
          : DeltaResponse.fromJson(json['delta'] as Map<String, dynamic>),
      finishReason: json['finish_reason'] as String?,
      index: json['index'] as int,
    );

Map<String, dynamic> _$StreamChoiceResponseToJson(
        StreamChoiceResponse instance) =>
    <String, dynamic>{
      'delta': instance.delta,
      'finish_reason': instance.finishReason,
      'index': instance.index,
    };

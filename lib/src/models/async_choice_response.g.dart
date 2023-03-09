// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'async_choice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsyncChoiceResponse _$AsyncChoiceResponseFromJson(Map<String, dynamic> json) =>
    AsyncChoiceResponse(
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      finishReason: json['finish_reason'] as String?,
      index: json['index'] as int,
    );

Map<String, dynamic> _$AsyncChoiceResponseToJson(
        AsyncChoiceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'finish_reason': instance.finishReason,
      'index': instance.index,
    };

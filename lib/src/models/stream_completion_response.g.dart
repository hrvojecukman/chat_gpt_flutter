// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_completion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamCompletionResponse _$StreamCompletionResponseFromJson(
        Map<String, dynamic> json) =>
    StreamCompletionResponse(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      model: json['model'] as String?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => StreamChoiceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      streamMessageEnd: json['stream_message_end'] as bool? ?? false,
    );

Map<String, dynamic> _$StreamCompletionResponseToJson(
        StreamCompletionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
      'stream_message_end': instance.streamMessageEnd,
    };

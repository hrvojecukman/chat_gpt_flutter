import 'package:json_annotation/json_annotation.dart';

enum ChatGptModel {
  @JsonValue('babbage')
  babbage,
  @JsonValue('text-babbage-001')
  textBabbage001,
  @JsonValue('ada')
  ada,
  @JsonValue('text-ada-001')
  textAda001,
  @JsonValue('davinci')
  davinci,
  @JsonValue('text-davinci-001')
  textDavinci001,
  @JsonValue('text-davinci-002')
  textDavinci002,
  @JsonValue('text-davinci-003')
  textDavinci003,
  @JsonValue('code-davinci-002')
  codeDavinci002,
  @JsonValue('davinci-instruct-beta')
  davinciInstructBeta,
  @JsonValue('curie-instruct-beta')
  curieInstructBeta,
  @JsonValue('code-cushman-001')
  codeCushman001,
  @JsonValue('curie')
  curie,
  @JsonValue('text-curie-001')
  textCurie001,
  @JsonValue('gpt-3.5-turbo')
  gpt35Turbo(modelName: 'gpt-3.5-turbo'),
  @JsonValue('gpt-3.5-turbo-0301')
  gpt35Turbo0301,
  @JsonValue('gpt-4')
  gpt4(modelName: 'gpt-4'),
  @JsonValue('gpt-4-0314')
  gpt40314;

  final String modelName;

  const ChatGptModel({
    this.modelName = '',
  });
}

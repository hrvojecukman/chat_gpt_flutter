import 'package:json_annotation/json_annotation.dart';

enum ChatGptModel {
  @JsonValue('babbage')
  babbage(modelName: 'babbage'),
  @JsonValue('text-babbage-001')
  textBabbage001(modelName: 'text-babbage-001'),
  @JsonValue('ada')
  ada(modelName: 'ada'),
  @JsonValue('text-ada-001')
  textAda001(modelName: 'text-ada-001'),
  @JsonValue('davinci')
  davinci(modelName: 'davinci'),
  @JsonValue('text-davinci-001')
  textDavinci001(modelName: 'text-davinci-001'),
  @JsonValue('text-davinci-002')
  textDavinci002(modelName: 'text-davinci-002'),
  @JsonValue('text-davinci-003')
  textDavinci003(modelName: 'text-davinci-003'),
  @JsonValue('code-davinci-002')
  codeDavinci002(modelName: 'code-davinci-002'),
  @JsonValue('davinci-instruct-beta')
  davinciInstructBeta(modelName: 'davinci-instruct-beta'),
  @JsonValue('curie-instruct-beta')
  curieInstructBeta(modelName: 'curie-instruct-beta'),
  @JsonValue('code-cushman-001')
  codeCushman001(modelName: 'code-cushman-001'),
  @JsonValue('curie')
  curie(modelName: 'curie'),
  @JsonValue('text-curie-001')
  textCurie001(modelName: 'text-curie-001'),
  @JsonValue('gpt-3.5-turbo')
  gpt35Turbo(modelName: 'gpt-3.5-turbo'),
  @JsonValue('gpt-3.5-turbo-0301')
  gpt35Turbo0301(modelName: 'gpt-3.5-turbo-0301'),
  @JsonValue('gpt-4')
  gpt4(modelName: 'gpt-4'),
  @JsonValue('gpt-4-0314')
  gpt40314(modelName: 'gpt-4-0314');

  final String modelName;

  const ChatGptModel({
    required this.modelName,
  });
}

import 'package:json_annotation/json_annotation.dart';

part 'completion_request.g.dart';

/// A [CompletionRequest] class that represents the model used for generating
/// text completions based on a given prompt, with several configurable parameters.
@JsonSerializable(fieldRename: FieldRename.snake)
class CompletionRequest {
  /// The language model to be used for text generation.
  final String model;

  /// The list of initial input prompts for the text generation.
  final List<String>? prompt;

  /// The maximum number of tokens to be generated in the completion.
  /// Default value is 16.
  final int? maxTokens;

  /// Controls randomness in the model's output.
  /// Setting it to higher values makes the output more random.
  /// Default value is 0.
  final double? temperature;

  /// Controls the randomness to favor top-p tokens.
  /// Is mutually exclusive with `temperature`, i.e., both can't be set at the same time.
  final double? topP;

  /// Number of completions to generate in parallel.
  /// Default value is 1.
  final int? n;

  final bool? stream;

  /// The list of stop sequences. The model will stop generating further
  /// when it encounters any of these sequences. Max 4
  final List<String>? stop;

  CompletionRequest({
    required this.model,
    required this.prompt,
    this.temperature = 0,
    this.maxTokens = 16,
    this.topP,
    this.n = 1,
    this.stream,
    this.stop,
  }) : assert(!(temperature != null && topP != null));

  factory CompletionRequest.fromJson(Map<String, dynamic> data) =>
      _$CompletionRequestFromJson(data);

  Map<String, dynamic> toJson() => _$CompletionRequestToJson(this);
}

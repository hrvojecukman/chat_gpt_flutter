import 'package:chat_gpt_flutter/src/models/completition_request.dart';
import 'package:chat_gpt_flutter/src/models/completition_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @POST('/completions')
  Future<CompleteResponse> createCompletion(@Body() CompletionRequest request);
}

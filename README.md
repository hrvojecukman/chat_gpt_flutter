ChatGPT API implemented in Flutter

## Getting started

You have to create OpenAI account and request API key from
here: https://beta.openai.com/account/api-keys

## Usage

```dart

final chatGpt = ChatGpt(apiKey: apiKey);

final testPrompt =
    'Which Disney character famously leaves a glass slipper behind at a royal ball?';

final testRequest = CompletionRequest(
  prompt: testPrompt,
  model: ChatGptModel.textDavinci003.key,
);

final result = await chatGpt.createCompletion(testRequest);

```

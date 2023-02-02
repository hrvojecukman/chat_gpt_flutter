ChatGPT API implemented in Flutter

[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png "Buy Me A Coffee")](https://www.buymeacoffee.com/hrvojecukman "Buy Me A Coffee")

![Usage example](https://hrvojecukman.github.io/chat_gpt/chat_gpt.gif)

## Getting started

You have to create OpenAI account and request API key from
here: https://beta.openai.com/account/api-keys


## Stream usage

```dart

final chatGpt = ChatGpt(apiKey: apiKey);

final question =
    'Which Disney character famously leaves a glass slipper behind at a royal ball?';

final request = CompletionRequest(
  prompt: question,
  stream: true,
  maxTokens: 4000,
  model: ChatGptModel.textDavinci003.key,
);

final stream = await chatGpt.createCompletionStream(request);

```
## Usage without stream

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

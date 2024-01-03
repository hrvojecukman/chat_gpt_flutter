import 'dart:async';
import 'dart:developer';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:example/models/question_answer.dart';
import 'package:flutter/material.dart';

class ChatCompletionPage extends StatefulWidget {
  final ChatGpt chatGpt;

  const ChatCompletionPage({super.key, required this.chatGpt});

  @override
  State<ChatCompletionPage> createState() => _ChatCompletionPageState();
}

class _ChatCompletionPageState extends State<ChatCompletionPage> {
  String? answer;
  bool loading = false;
  final testPrompt =
      'Which Disney character famously leaves a glass slipper behind at a royal ball?';

  final List<QuestionAnswer> questionAnswers = [];

  late TextEditingController textEditingController;

  StreamSubscription<CompletionResponse>? streamSubscription;
  StreamSubscription<StreamCompletionResponse>? chatStreamSubscription;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    chatStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: questionAnswers.length,
                  itemBuilder: (context, index) {
                    final questionAnswer = questionAnswers[index];
                    final answer = questionAnswer.answer.toString().trim();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Q: ${questionAnswer.question}'),
                        const SizedBox(height: 12),
                        if (answer.isEmpty && loading)
                          const Center(child: CircularProgressIndicator())
                        else
                          Text('A: $answer'),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: const InputDecoration(hintText: 'Type in...'),
                      onFieldSubmitted: (_) => _sendChatMessage(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ClipOval(
                    child: Material(
                      color: Colors.blue, // Button color
                      child: InkWell(
                        onTap: _sendChatMessage,
                        child: const SizedBox(
                          width: 48,
                          height: 48,
                          child: Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sendChatMessage() async {
    final question = textEditingController.text;
    setState(() {
      textEditingController.clear();
      loading = true;
      questionAnswers.add(
        QuestionAnswer(
          question: question,
          answer: StringBuffer(),
        ),
      );
    });
    final testRequest = ChatCompletionRequest(
      stream: true,
      maxTokens: 4000,
      messages: [Message(role: Role.user.name, content: question)],
      model: ChatGptModel.gpt41106Preview.modelName,
    );
    await _chatStreamResponse(testRequest);

    setState(() => loading = false);
  }

  _chatStreamResponse(ChatCompletionRequest request) async {
    chatStreamSubscription?.cancel();
    try {
      final stream = await widget.chatGpt.createChatCompletionStream(request);
      chatStreamSubscription = stream?.listen(
        (event) => setState(
          () {
            if (event.streamMessageEnd) {
              chatStreamSubscription?.cancel();
            } else {
              return questionAnswers.last.answer.write(
                event.choices?.first.delta?.content,
              );
            }
          },
        ),
      );
    } catch (error) {
      setState(() {
        loading = false;
        questionAnswers.last.answer.write("Error");
      });
      log("Error occurred: $error");
    }
  }
}

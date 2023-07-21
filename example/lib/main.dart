import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:example/chat_completion_page.dart';
import 'package:example/completion_page.dart';
import 'package:flutter/material.dart';

const apiKey = '';

void main() => runApp(MyApp(chatGpt: ChatGpt(apiKey: apiKey)));

class MyApp extends StatelessWidget {
  final ChatGpt chatGpt;

  const MyApp({super.key, required this.chatGpt});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text('Chat completion')),
                Tab(icon: Text('Completion')),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ChatCompletionPage(chatGpt: chatGpt),
              CompletionPage(chatGpt: chatGpt),
            ],
          ),
        ),
      ),
    );
  }
}

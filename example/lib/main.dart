import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:example/chat_completion_page.dart';
import 'package:example/completion_page.dart';
import 'package:example/secrets.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

//TODO: put your own apiKey
final chatGpt = ChatGpt(apiKey: apiKey);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

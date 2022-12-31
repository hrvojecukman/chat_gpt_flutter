import 'package:chat_gpt/chat_gpt.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

const apiKey = '';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? answer;
  final chatGpt = ChatGpt(apiKey: apiKey);
  bool loading = false;
  final testPrompt =
      'Which Disney character famously leaves a glass slipper behind at a royal ball?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Q: $testPrompt'),
            if (loading)
              const Center(child: CircularProgressIndicator())
            else if (answer != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('A: $answer'),
              ),
          ],
        ),
      ),
      floatingActionButton: loading
          ? const CircularProgressIndicator()
          : FloatingActionButton.extended(
              onPressed: () async {
                setState(() {
                  loading = true;
                });
                final testRequest = CompletionRequest(
                  prompt: testPrompt,
                  model: ChatGptModel.textDavinci003.key,
                );
                final result = await chatGpt.createCompletion(testRequest);
                setState(() {
                  answer = result;
                  loading = false;
                });
              },
              label: const Text("Get answer"),
            ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

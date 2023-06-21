import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/repositories/repo.dart';
import '../../data/data_sources/remote_data_source.dart';
import '../../domain/entities/message_creation_data.dart';
import '../../domain/use_cases/send_message_use_case.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  static const routeName = '/chat';

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _questionController = TextEditingController();
  final _messages = <String>[];

  void _sendMessage() async {
    try {
      final message = _questionController.text;
      _questionController.clear();

      setState(() => _messages.add(message));

      const usecase = SendMessageUseCase(
        repository: ChatRepository(dataSource: ChatRemoteDataSource()),
      );

      final responseMessage = await usecase(
        creationData: MessageCreationData(message: message),
      );

      setState(() {
        _messages.add(responseMessage.choices.first.message.content);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          action: SnackBarAction(
            label: 'Ok',
            onPressed: () {},
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT App'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_messages[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _messages[index]));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Copied'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
                Expanded(
                  child: TextField(
                    controller: _questionController,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Enter your question...',
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

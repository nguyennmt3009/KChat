import 'package:flutter/material.dart';
import 'package:kchat/components/message-bubble.dart';
import 'package:kchat/models/message.dart';
import 'package:kchat/apis/chatgpt.dart';
import 'dart:math';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final textFieldController = TextEditingController();

  bool isLoading = false;
  final _random = Random();
  List<Message> messageList = [];

  @override
  void initState() {
    super.initState();
    messageList.add(
      Message(content: 'Ask me anything !', createdAt: DateTime.now(), isOwner: false, isLoading: false)
    );
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('KChat'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 60.0),
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: messageList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return MessageBubble(
                      message: messageList[index],
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                        child: TextField(
                          controller: textFieldController,
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      iconSize: 35.0,
                      color: Colors.grey[800],
                      onPressed: () {
                        setState(() {
                          String message = textFieldController.text;
                          messageList.add(
                            Message(content: message, createdAt: DateTime.now(), isOwner: true, isLoading: false)
                          );
                          messageList.add(
                            Message(content: '...', createdAt: DateTime.now(), isOwner: false, isLoading: true)
                          );
                          callChatAPI(message).then((value) => {
                            setState(() {
                              messageList.removeLast();
                              messageList.add(
                                Message(content: value, createdAt: DateTime.now(), isOwner: false, isLoading: false)
                              );
                            })
                          });
                          textFieldController.text = '';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}


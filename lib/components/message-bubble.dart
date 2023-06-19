import 'package:flutter/material.dart';
import 'package:kchat/models/message.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isOwner ? Alignment.topRight : Alignment.topLeft,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          padding: const EdgeInsets.all(15.0),
          decoration: message.isOwner ?
            BoxDecoration(
              color: Colors.grey[800],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(25.0),
                  bottomLeft: Radius.circular(25.0)
              ),
            ) :
            BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0)
              ),
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !message.isLoading ?
                Text(
                  message.content,
                  style: TextStyle(
                    color: !message.isOwner ? Colors.black : Colors.white,
                    fontSize: 16.0
                  ),
                ) :
                const SpinKitThreeBounce(
                  color: Colors.black,
                  size: 16.0,
                )
            ],
          ),
        ),
      ),
    );
  }
}
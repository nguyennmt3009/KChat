import 'package:flutter/material.dart';
import 'package:kchat/pages/home.dart';
import 'package:kchat/pages/chatbox.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      '/chatbox': (context) => const ChatBox(),
    },
  ));
}

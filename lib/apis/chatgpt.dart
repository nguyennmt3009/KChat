import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:kchat/keys.dart';

Future<String> callChatAPI (String message) async {
  try {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': chatGPTKey,
      },
      body: jsonEncode(<String, dynamic>{
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content": "You are a helpful assistant."
          },
          {
            "role": "user",
            "content": message
          }
        ]
      }),
    );

    Map data = jsonDecode(utf8.decode(response.bodyBytes));
    String result = data['choices'][0]['message']['content'].trim();
    return result;
  } catch (e) {
    print('Error: $e');
    return 'Error !';
  }
}
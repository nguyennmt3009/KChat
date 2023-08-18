import 'package:flutter/services.dart';

enum NativeMethodType {
  setupRakutenPoint,
}

class NativeMethod {
  static const channel = MethodChannel('com.skyjar/native');

  static Future<dynamic> invokeMethod(NativeMethodType type) async {

    try {
      final result = await channel.invokeMethod(type.name);
      return result;
    } catch (e) {
      print('invokeMethod: error=${e.toString()}');
    }

    return null;
  }
}

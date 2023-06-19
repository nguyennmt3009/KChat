import 'package:intl/intl.dart';

class Message {
  String content;
  DateTime createdAt;
  bool isOwner;
  bool isLoading;
  final DateFormat _dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  Message({ required this.content, required this.createdAt, required this.isOwner, required this.isLoading });

  String getFormatTime() {
    return _dateFormat.format(createdAt);

  }
}
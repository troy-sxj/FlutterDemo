import 'package:flutter_app/cookbook/list/ListItem.dart';

class MessageItem implements ListItem{
  final String sender;
  final String message;

  MessageItem(this.sender, this.message);

}
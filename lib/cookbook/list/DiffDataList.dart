import 'package:flutter/material.dart';
import 'package:flutter_app/cookbook/list/HeadeItem.dart';
import 'package:flutter_app/cookbook/list/ListItem.dart';
import 'package:flutter_app/cookbook/list/MessageItem.dart';

class DiffDataList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "DiffDataList",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("DiffDataList"),
        ),
        body: new DataList(
          items: new List<ListItem>.generate(
              1000,
              (i) => i % 6 == 0
                  ? new HeadeItem("Head $i")
                  : new MessageItem("Sender $i", "Message $i")),
        ),
      ),
    );
  }
}

class DataList extends StatelessWidget {
  final List<ListItem> items;

  const DataList({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          if (item is HeadeItem) {
            return new ListTile(
              title: new Text(
                item.head,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          } else if (item is MessageItem) {
            return new ListTile(
              title: new ListTile(
                title: new Text(item.sender),
                subtitle: new Text(item.message),
              ),
            );
          }
        });
  }
}

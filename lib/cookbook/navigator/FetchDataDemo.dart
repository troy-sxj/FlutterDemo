import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<Post> fetchPost() async {
  var dio = new Dio();
  Response response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
  final responseBody = json.decode(response.data);
  debugPrint(responseBody.toString());
  return new Post.fromJson(responseBody);
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class FetchDataDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "FeatchData",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Fetch Data Example'),
        ),
        body: new Center(
          child: new FutureBuilder<Post>(
              future: fetchPost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return new Text(snapshot.data.title);
                } else if (snapshot.hasError) {
                  return new Text('${snapshot.error}');
                }
                return new CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}

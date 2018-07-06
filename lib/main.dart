import "package:english_words/english_words.dart";
import "package:flutter/material.dart";
import 'package:flutter_app/DetailPage.dart';
import 'package:flutter_app/cookbook/navigator/FetchDataDemo.dart';
//引用material组件

void main() => runApp(new FetchDataDemo());

//    runApp(new MaterialApp(
//        title: 'Shopping App', home: new ShoppingList(products: <Product>[
//          new Product(name: 'Eggs'),
//          new Product(name: 'Flour'),
//          new Product(name: 'Chocolate chips'),
//    ],))); //入口函数

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "StartUp Name Generator",
//      theme: new ThemeData(
//        primaryColor: Colors.white,
//      ),
      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Welcome to flutter"),
//        ),
        body: new Center(
          child: new DetailPage(),
        ),
      ),
    );
    //
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _alreadySaved = new Set<WordPair>();
  final _biggerFont = new TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return new ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return new Divider();

      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair wordPair) {
    final hasSaved = _alreadySaved.contains(wordPair);
    return new ListTile(
      title: new Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        hasSaved ? Icons.favorite : Icons.favorite_border,
        color: hasSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (hasSaved) {
            _alreadySaved.remove(wordPair);
          } else {
            _alreadySaved.add(wordPair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) {
        final titles = _alreadySaved.map((pair) {
          return new ListTile(
            title: new Text(pair.asPascalCase, style: _biggerFont),
          );
        });
        final divided =
            ListTile.divideTiles(context: context, tiles: titles).toList();

        return new Scaffold(
          appBar: new AppBar(
            title: new Text("Saved Suggestions"),
          ),
          body: new ListView(children: divided),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("StartUp Name Generator"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

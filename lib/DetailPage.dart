import "package:flutter/material.dart";

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///标题区域
    Widget titleSection = new Container(
      //设置padding
      padding: EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: new Text("Oeschinen Lake Campground",
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              ),
              new Text(
                "Kandersteg, Switzerland",
                style: new TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          new Icon(Icons.star, color: Colors.red),
          new Text("41"),
        ],
      ),
    );

    /// ignore: slash_for_doc_comments
    /// 构建button的嵌套函数
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            icon,
            color: color,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
    }

    ///按钮区域
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, "CALL"),
          buildButtonColumn(Icons.near_me, "ROUTE"),
          buildButtonColumn(Icons.share, "SHARE"),
        ],
      ),
    );

    ///文本区域
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: "Flutter Demo",
      home: Scaffold(
        appBar: AppBar(
          title: new Text("Top Lakes"),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('images/lake.jpg',width: 600.0, height: 240.0, fit:BoxFit.cover),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );

  }
}

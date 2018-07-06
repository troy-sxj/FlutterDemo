import 'package:flutter/material.dart';

class AppBarBottomDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AppBarBottomDemoState();
  }
}

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: const Text('Tabbed AppBar'),
            bottom: new TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return new Tab(
                  text: choice.title,
                  icon: new Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: new TabBarView(
            children: choices.map((Choice choice) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class BasicAppBarSample extends StatefulWidget {
  @override
  _BasicAppBarSampleState createState() => new _BasicAppBarSampleState();
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    setState(() { // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Basic AppBar'),
          actions: <Widget>[
            new IconButton( // action button
              icon: new Icon(choices[0].icon),
              onPressed: () { _select(choices[0]); },
            ),
            new IconButton( // action button
              icon: new Icon(choices[1].icon),
              onPressed: () { _select(choices[1]); },
            ),
            new PopupMenuButton<Choice>( // overflow menu
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {
                  return new PopupMenuItem<Choice>(
                    value: choice,
                    child: new Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new ChoiceCard(choice: _selectedChoice),
        ),
      ),
    );
  }
}

class _AppBarBottomDemoState extends State<AppBarBottomDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: choices.length, vsync: this);
  }

  void _nextPage(int delta) {
    final int nextIndex = _tabController.index + delta;
    if (nextIndex < 0 || nextIndex >= _tabController.length) return;
    _tabController.animateTo(nextIndex);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'AppBarBottom',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('AppBarBottom'),
          leading: new IconButton(
              icon: Icon(Icons.arrow_back),
              tooltip: 'Previous choice',
              onPressed: () {
                _nextPage(-1);
              }),
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                _nextPage(1);
              },
              tooltip: 'Next choice',
            )
          ],
          bottom: new PreferredSize(
              child: new Theme(
                  data: Theme.of(context).copyWith(accentColor: Colors.white),
                  child: new Container(
                    height: 24.0,
                    alignment: Alignment.center,
                    child: new TabPageSelector(
//                      color: Colors.white,
//                      selectedColor: Colors.black,
                      controller: _tabController,
                    ),
                  ),
              ),
              preferredSize: Size.fromHeight(24.0)),
        ),
        body: new TabBarView(
            controller: _tabController,
            children: choices.map((Choice choice) {
              return new Padding(
                padding: EdgeInsets.all(16.0),
                child: new ChoiceCard(
                  choice: choice,
                ),
              );
            }).toList()),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  final Choice choice;

  ChoiceCard({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Icon(
            choice.icon,
            size: 128.0,
            color: textStyle.color,
          ),
          new Text(
            choice.title,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnimatedListDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  final GlobalKey<AnimatedListState> _listKey = new GlobalKey();
  ListModel<int> _list;
  int _selectionItem;
  int _nextItem;

  @override
  void initState() {
    super.initState();
    _list = new ListModel(
      listKey: _listKey,
      removedItemBuilder: _buildRemovedItem,
      initialItems: <int>[0, 1, 2],
    );
    _nextItem = 3;
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectionItem == _list[index],
      onTap: () {
        setState(() {
          _selectionItem = _selectionItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return new CardItem(
      item: item,
      selected: false,
      animation: animation,
    );
  }

  void _insert() {
    final index =
        _selectionItem == null ? _list.length : _list.indexOf(_selectionItem);
    _list.insert(index, _nextItem++);
  }

  void _remove() {
    if (_selectionItem != null) {
      _list.removeAt(_list.indexOf(_selectionItem));
      setState(() {
        _selectionItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedList',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Animated List'),
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.add),
              onPressed: _insert,
              tooltip: 'insert a new item',
            ),
            new IconButton(
              icon: Icon(Icons.remove),
              onPressed: _remove,
              tooltip: 'remove the select item',
            ),
          ],
        ),
        body: new Padding(
          padding: EdgeInsets.all(16.0),
          child: new AnimatedList(
              itemBuilder: _buildItem,
              initialItemCount: _list.length,
              key: _listKey),
        ),
      ),
    );
  }
}

class ListModel<E> {
  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E> initialItems,
  })  : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = new List<E>.from(initialItems ?? <E>[]);

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(index,
          (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

class CardItem extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  CardItem(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.item,
      this.selected: false})
      : assert(animation != null),
        assert(item != null && item >= 0),
        assert(selected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected) {
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }
    return new Padding(
      padding: EdgeInsets.all(2.0),
      child: new SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: new SizedBox(
            height: 128.0,
            child: new Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: new Center(
                child: new Text(
                  'Item $item',
                  style: textStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

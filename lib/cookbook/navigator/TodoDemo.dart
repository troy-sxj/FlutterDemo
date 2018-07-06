import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);

}


class TodoDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Passing Data',
      home: new TodoScreen(
        todos: new List.generate(
          20,
              (i) =>
          new Todo(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
          ),
        ),
      ),
    );
  }
}

class TodoScreen extends StatelessWidget {

  final List<Todo> todos;

  TodoScreen({Key key, this.todos}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('todos'),
      ),
      body: new ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text(todos[index].title),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new DetailScreen(todo: todos[index],),
                ));
              },
            );
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {

  final Todo todo;

  DetailScreen({Key key, this.todo}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${todo.title}'),
      ),
      body: new Center(
        child: new Text('${todo.description}'),
      ),
    );
  }
}
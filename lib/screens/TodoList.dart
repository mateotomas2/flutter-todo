import 'package:flutter/material.dart';
import 'package:fluttertodo/common/notifications.dart';
import 'package:fluttertodo/models/config/ConfigModel.dart';
import 'package:fluttertodo/screens/ConfigMenu.dart';
import 'package:fluttertodo/screens/TodoAdd.dart';
import 'package:fluttertodo/widgets/list/Todo.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  static const routeName = '/';

  TodoList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    initializeNotifications(context);

    loadConfig();
  }

  void loadConfig() async {
    final config = Provider.of<ConfigModel>(context, listen: false);
    await config.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(LineAwesomeIcons.wrench),
              onPressed: () {
                Navigator.pushNamed(context, ConfigMenu.routeName);
              },
            ),
          ],
        ),
        body: Consumer<ConfigModel>(builder: (context, config, child) {
          if (config.todos == null || config.todos.length == 0) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text("Nothing to see here"),
                ]));
          }

          return ReorderableListView(
              onReorder: (int oldIndex, int newIndex) {
                config.moveTodoElement(oldIndex, newIndex);
              },
              children: <Widget>[
                for (var i = 0; i < config.todos.length; i++)
                  Container(key:ValueKey(i),child:Todo(index:i)),
              ]);
        }),
        floatingActionButton:
            Consumer<ConfigModel>(builder: (context, config, child) {
          return FloatingActionButton(
            onPressed: () => {Navigator.pushNamed(context, TodoAdd.routeName)},
            tooltip: 'Add',
            child: Icon(LineAwesomeIcons.plus),
          );
        }));
  }
}

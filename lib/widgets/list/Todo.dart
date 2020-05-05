import 'package:flutter/material.dart';
import 'package:fluttertodo/models/config/ConfigModel.dart';
import 'package:fluttertodo/screens/TodoAdd.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';

class Todo extends StatelessWidget {
  final int index;

  Todo({this.index});

  showRemoveDialog(context, int index) async {
    final config = Provider.of<ConfigModel>(context, listen: false);
    await showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          actions: [
            RaisedButton(
              child: Text("No"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              color: Colors.red,
              child: Text("Yes"),
              onPressed: () {
                config.removeTodo(index);
                Navigator.pop(context);
              },
            ),
          ],
          title: Text("Remove todo"),
          content: Text("Are you sure?"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigModel>(builder: (context, config, child) {
      return ListTile(
        key: new Key("$index"),
        title: Text(
            config.todos[index].title != null
                ? config.todos[index].title
                : "null",
            style: config.todos[index].done
                ? TextStyle(decoration: TextDecoration.lineThrough)
                : TextStyle(decoration: TextDecoration.none)),
        leading: Checkbox(
          value: config.todos[index].done,
          onChanged: (bool value) {
            config.todos[index].setDone(value);
            config.notifyAndSave();
          },
        ),
        onTap: () {
          Navigator.pushNamed(context, TodoAdd.routeName, arguments: index);
        },
        trailing: IconButton(
          onPressed: () {
            showRemoveDialog(context, index);
          },
          icon: Icon(LineAwesomeIcons.trash),
        ),
      );
    });
  }
}

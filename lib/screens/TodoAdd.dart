import 'package:flutter/material.dart';
import 'package:fluttertodo/models/config/ConfigModel.dart';
import 'package:fluttertodo/models/todo/TodoModel.dart';
import 'package:fluttertodo/screens/ConfigMenu.dart';
import 'package:fluttertodo/widgets/form/TextFieldCustom.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';

class TodoAdd extends StatefulWidget {
  static const routeName = '/add-todo';

  TodoAdd({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TodoAddState createState() => _TodoAddState();
}

class _TodoAddState extends State<TodoAdd> {
  TextEditingController controllerTitle = TextEditingController();
  TodoModel model = TodoModel();

  @override
  void initState() {
    super.initState();
    model.done = false;
  }

  void loadEditData(int index) async {
    final config = Provider.of<ConfigModel>(context, listen: false);

    controllerTitle.text = config.todos[index].title;
    model.setTitle(config.todos[index].title);
  }

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context).settings.arguments;
    if (index != null){
      loadEditData(index);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Consumer<ConfigModel>(builder: (context, config, child) {
          return TextFieldCustom(
              label: "Title:",
              autofocus: true,
              controller: controllerTitle,
              onChanged: model.setTitle);
        }),
        floatingActionButton:
            Consumer<ConfigModel>(builder: (context, config, child) {
          return FloatingActionButton(
            onPressed: () {
              if (index == null) {
                config.addTodo(model);
              } else {
                config.updateTodo(index, model);
              }
              Navigator.pop(context);
            },
            tooltip: 'Save',
            child: Icon(LineAwesomeIcons.save),
          );
        }));
  }
}

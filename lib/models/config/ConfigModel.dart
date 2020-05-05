import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluttertodo/models/todo/TodoModel.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'ConfigModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ConfigModel extends ChangeNotifier {
  String userName;
  List<TodoModel> todos;
  int index;

  ConfigModel({this.userName, this.index, this.todos});

  void setUserName(String _userName) {
    userName = _userName;
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyAndSave();
  }

  void setTodos(List<TodoModel> _todos) {
    todos = _todos;
    notifyAndSave();
  }

  void setIndex(int value) {
    index = value;
    notifyAndSave();
  }

  void addTodo(TodoModel todo) {
    if (todos == null) todos = new List<TodoModel>();
    todos.add(todo);
    notifyAndSave();
  }

  void updateTodo(int index, TodoModel todo) {
    todos[index] = todo;
    notifyAndSave();
  }

  void moveTodoElement(int oldIndex, int newIndex) {
    // When reordering and item is going down in the list, the new index is one away from true index
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    var aux = todos[oldIndex];
    todos.removeAt(oldIndex);
    // Because we are deleting the old element in index, if we are at the bottom we need to insert the element instead of modifying it
    if (newIndex <= todos.length) {
      todos.insert(newIndex, aux);
    } else {
      todos.add(aux);
    }

    notifyAndSave();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    notifyAndSave();
  }

  void removeAll() {
    todos.clear();
    notifyAndSave();
  }

  factory ConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigModelToJson(this);

  void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("saving" + json.encode(this.toJson()));
    prefs.setString('appConfig', json.encode(this.toJson()));
  }

  Future load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String result = prefs.getString('appConfig');

    if (result != null && result != "") {
      ConfigModel config = ConfigModel.fromJson(json.decode(result));
      userName = config.userName;
      index = config.index;
      todos = config.todos;
      notifyListeners();
    }
  }

  void notifyAndSave() {
    notifyListeners();
    save();
  }
}

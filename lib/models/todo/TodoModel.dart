import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'TodoModel.g.dart';

@JsonSerializable(explicitToJson: true)
class TodoModel extends ChangeNotifier {
  String title;
  bool done;

  TodoModel({this.title});

  void setTitle(String _title) {
    title = _title;
    notifyListeners();
  }

  void setDone(bool _done) {
    done = _done;
    notifyListeners();
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}

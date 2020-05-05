// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TodoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return TodoModel(
    title: json['title'] as String,
  )..done = json['done'] as bool;
}

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'title': instance.title,
      'done': instance.done,
    };

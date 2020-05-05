// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConfigModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigModel _$ConfigModelFromJson(Map<String, dynamic> json) {
  return ConfigModel(
    userName: json['userName'] as String,
    index: json['index'] as int,
    todos: (json['todos'] as List)
        ?.map((e) =>
            e == null ? null : TodoModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConfigModelToJson(ConfigModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'todos': instance.todos?.map((e) => e?.toJson())?.toList(),
      'index': instance.index,
    };

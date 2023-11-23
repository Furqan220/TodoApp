
class TodoModel {
  final Map<String, dynamic> map;
  const TodoModel({this.map = const {}});

  String get id => map["_id"] as String? ?? '';
  String get userId => map["userId"] as String? ?? '';
  String get title => map["title"] as String? ?? '';
  String get desc => map["desc"] as String? ?? '';
  String get category => map["category"] as String? ?? '';
  bool get isCompleted => map["isCompleted"] as bool? ?? false;
  String get createdAt => map["createdAt"] as String? ?? '';
  String get updatedAt => map["updatedAt"] as String? ?? '';
  String get v => map["__v"].toString();
}


/*

_id
654ab8b9a5f32f0cd21445cc
userId
654ab478bc15d2a6e46ca23b
title
"My First Todo"
desc
"This is my first Todo"
category
"personal"
isCompleted
false
createdAt
2023-11-07T22:22:49.074+00:00
updatedAt
2023-11-07T22:22:49.074+00:00
__v
0
 */
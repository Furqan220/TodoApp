import 'package:todo_app/res/export_all.dart';

class User extends LocalStorage {
  static User data = User();

  final Map<String, dynamic> map;
  const User({this.map = const {}}) : super(fileName: "user", value: map);

  @override
  Future<void> clear() async {
    await clearLocal();
    data = User();
  }

  @override
  Future<void> init() async {
    data = User(map: await readFromFile());
  }

  String get id => map["_id"] as String? ?? '';
  String get token => map["token"] as String? ?? '';
  String get email => map["email"] as String? ?? '';
  String get username => map["username"] as String? ?? '';
  String get createdAt => map["createdAt"] as String? ?? '';
  String get updatedAt => map["updatedAt"] as String? ?? '';
  String get v => map["__v"].toString();
}

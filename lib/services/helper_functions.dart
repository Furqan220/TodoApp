import 'dart:io';
import 'package:todo_app/res/export_all.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:path/path.dart';


class HelperFunctions {
  static final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static bool isEmailValid(String email) {
    return emailRegExp.hasMatch(email.trim());
  }


   static Future<void> deletePreviousStorage() async {
    File file = File(
        join((await pp.getApplicationSupportDirectory()).path, 'first_launch'));
    if (!file.existsSync()) {
      await const FlutterSecureStorage().deleteAll();
      file.createSync();
    }
  }

}

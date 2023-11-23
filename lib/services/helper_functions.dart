import 'dart:io';
import 'package:todo_app/res/export_all.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:path/path.dart';
import 'package:intl/intl.dart';

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

  static String getFirstName(String name) {
    String fullname = name.replaceAll(RegExp(r' '), ' ,');
    List<String> splitted = fullname.split(' ');
    name = splitted[0];
    return name;
  }

  static String getPercentageString(String val) {
    double toDouble = double.parse(val);
    int toInt = toDouble.toInt();
    return "$toInt %";
  }

  static bool isDifferenceLessThan24Hours(
      String dateTimeString1, String dateTimeString2) {
    final dateFormat = DateFormat("yyyy-MM-dd");

    // G.Log("Expiry Date    $dateTimeString1");
    // G.Log("current Date    $dateTimeString2");

    DateTime dateTime1;
    DateTime dateTime2;

    dateTime1 = dateFormat.parse(dateTimeString1);
    dateTime2 = dateFormat.parse(dateTimeString2);

    return dateTime1.toString() == dateTime2.toString();
    // try {
    //   dateTime1 = dateFormatWithT.parse(dateTimeString1);
    // } catch (e) {
    //   dateTime1 = dateFormatWithoutT.parse(dateTimeString1);
    // }

    // try {
    //   dateTime2 = dateFormatWithT.parse(dateTimeString2);
    // } catch (e) {
    //   dateTime2 = dateFormatWithoutT.parse(dateTimeString2);
    // }

    // final difference = dateTime1.difference(dateTime2);
    // return difference.inHours < 24;
  }
}

import 'dart:developer';

import 'package:flutter/foundation.dart';

class G {
  static String fcmToken = "";
  static void Log(v) {
    if (kDebugMode) {
      log(v.toString());
    }
  }
}

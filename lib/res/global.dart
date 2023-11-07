import 'dart:developer';

import 'package:flutter/foundation.dart';

class G {
  static void Log(v) {
    if (kDebugMode) {
      log(v.toString());
    }
  }
}

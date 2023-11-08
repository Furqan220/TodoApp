import 'package:todo_app/res/export_all.dart';

class Utils {
  static SpinKitHourGlass spinkit = const SpinKitHourGlass(
    color: AppColors.kprimary,
  );

  static Future<dynamic> loader(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => spinkit);
  }

  static SnackbarController successBar(
      {required BuildContext context, required String message}) {
    return Get.rawSnackbar(
        message: message,
        margin: EdgeInsets.symmetric(horizontal: 0.048.sw, vertical: 0.021.sh),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
        borderRadius: 15.r,
        backgroundColor: AppColors.kValue1);
  }

  static SnackbarController errorBar(
      {required BuildContext context, required String message}) {
    return Get.rawSnackbar(
        message: message,
        margin: EdgeInsets.symmetric(horizontal: 0.048.sw, vertical: 0.021.sh),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
        borderRadius: 15.r,
        backgroundColor: Colors.red);
  }
}

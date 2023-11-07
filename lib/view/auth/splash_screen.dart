import 'dart:async';
import 'dart:io';

import 'package:todo_app/res/export_all.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onInit();
  }

  // Future<void> getTo() async {
  //   await Future.delayed(Duration(seconds: 2))
  //       .then((value) => Get.offNamed(RouteNames.login));
  // }

  Future<void> onInit() async {
    if (Platform.isIOS) {
      await HelperFunctions.deletePreviousStorage();
    }
    await const User().init();
    if (User.data.token.isNotEmpty) {
      
      Timer(const Duration(seconds: 2), () => Get.offAllNamed(RouteNames.home));
    } else {
      await const User().clear();
      Timer(const Duration(seconds: 2),
          () => Navigator.pushNamed(context, RouteNames.login));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xff0f1e4f),
            AppColors.kprimary,
            AppColors.kValue1
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text("Todo App",
              style: TextStyle(
                  color: AppColors.kWhite,
                  fontSize: 45.sp,
                  height: 1.5,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

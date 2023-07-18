import 'package:todo_app/export_all.dart';

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
    getTo();
  }

  Future<void> getTo() async {
    await Future.delayed(Duration(seconds: 2))
        .then((value) => Get.off(() => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff0f1e4f), kprimary, kValue1])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text("Todo App",
              style: TextStyle(
                  color: kWhite,
                  fontSize: 45.sp,
                  height: 1.5,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

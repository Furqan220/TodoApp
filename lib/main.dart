import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/res/export_all.dart';
import 'package:todo_app/services/notification_services.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // await FirebaseApi().initNotification();

    // G.fcmToken = "";
    // G.Log(G.fcmToken);
    runApp(MyApp());
  } on Exception catch (e) {
    runApp(ErrorWidget(e));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              colorScheme: ColorScheme.light(primary: AppColors.kprimary),
              textTheme: GoogleFonts.josefinSansTextTheme()),
          getPages: routes,
          initialRoute: RouteNames.splash,
        );
      },
    );
  }
}

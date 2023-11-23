import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/res/export_all.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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

import 'package:todo_app/res/export_all.dart';

List<GetPage> routes = [
  GetPage(name: RouteNames.splash, page: () => SplashScreen()),
  GetPage(name: RouteNames.login, page: () => LoginScreen()),
  GetPage(name: RouteNames.signUp, page: () => SignUpScreen()),
];

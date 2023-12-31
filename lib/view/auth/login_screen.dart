import 'package:todo_app/export_all.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
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
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 0.069.sw),
            children: [
              0.3.sh.verticalSpace,
              Text("Todo App",
                  style: TextStyle(
                      color: kWhite,
                      fontSize: 45.sp,
                      height: 1.5,
                      fontWeight: FontWeight.bold)),
              0.053.sh.verticalSpace,
              CustomTextField(
                  labelText: "Email",
                  hintText: "Enter your email",
                  controller: emailController),
              0.021.sh.verticalSpace,
              CustomTextField(
                  labelText: "Password",
                  hintText: "Enter your password",
                  controller: emailController),
              0.032.sh.verticalSpace,
              CustomButton(buttonText: "Login"),
              0.25.sh.verticalSpace,
              GestureDetector(
                onTap: () => Get.to(() => SignUpScreen()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: kWhite),
                    ),
                    6.w.horizontalSpace,
                    Text(
                      "Signup",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: kprimary),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

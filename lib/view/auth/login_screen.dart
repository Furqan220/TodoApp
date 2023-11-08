import 'package:todo_app/res/export_all.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  final AuthController controller = Get.put(AuthController());

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
      child: Form(
        key: form,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 0.069.sw),
              children: [
                0.3.sh.verticalSpace,
                Text("Todo App",
                    style: TextStyle(
                        color: AppColors.kWhite,
                        fontSize: 45.sp,
                        height: 1.5,
                        fontWeight: FontWeight.bold)),
                0.053.sh.verticalSpace,
                CustomTextField(
                    labelText: "Email",
                    hintText: "Enter your email",
                    focus: emailFocus,
                    nextFocus: passwordFocus,
                    controller: emailController),
                0.021.sh.verticalSpace,
                CustomTextField(
                    labelText: "Password",
                    hintText: "Enter your password",
                    focus: passwordFocus,
                    controller: passController),
                0.032.sh.verticalSpace,
                CustomButton(
                  buttonText: "Login",
                  buttonTextColor: AppColors.kWhite,
                  onTap: () {
                    if (form.currentState!.validate()) {
                      final dynamic data = {
                        'email': emailController.text.trim(),
                        'password': passController.text.trim(),
                      };

                      controller.loginApi(data, context);
                    }
                  },
                ),
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
                            color: AppColors.kWhite),
                      ),
                      6.w.horizontalSpace,
                      Text(
                        "Signup",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kprimary),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:todo_app/controllers/auth_controller.dart';
import 'package:todo_app/res/export_all.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  final form = GlobalKey<FormState>();
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
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.kWhite,
              )),
        ),
        backgroundColor: Colors.transparent,
        body: Form(
          key: form,
          child: SafeArea(
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
                  controller: emailController,
                  focus: emailFocus,
                  nextFocus: passwordFocus,
                  validator: (text) {
                    if (emailController.text.isEmpty) {
                      return "Please enter your email";
                    }
                  },
                ),
                0.021.sh.verticalSpace,
                CustomTextField(
                  labelText: "Password",
                  hintText: "Enter your password",
                  controller: passwordController,
                  focus: passwordFocus,
                  validator: (text) {
                    if (emailController.text.isEmpty) {
                      return "Please enter your password";
                    }
                  },
                ),
                0.032.sh.verticalSpace,
                CustomButton(
                  buttonText: "Sign Up",
                  buttonTextColor: AppColors.kWhite,
                  onTap: () {
                    if (form.currentState!.validate()) {
                      final dynamic data = {
                        'email': emailController.text.trim(),
                        'password': passwordController.text.trim(),
                      };

                      controller.signUpApi(data, context);
                    }
                  },
                ),
                0.25.sh.verticalSpace,
                GestureDetector(
                  onTap: () => Get.offNamed(RouteNames.login),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kWhite),
                      ),
                      6.w.horizontalSpace,
                      Text(
                        "Login",
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

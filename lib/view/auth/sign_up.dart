import 'package:todo_app/export_all.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final form = GlobalKey<FormState>();

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
        body: Form(
          key: form,
          child: SafeArea(
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
                  controller: emailController,
                  validator: (text) {
                    if (emailController.text.isEmpty) {
                      return "Please enter your email to continue";
                    }
                  },
                ),
                0.021.sh.verticalSpace,
                CustomTextField(
                    labelText: "Password",
                    hintText: "Enter your password",
                    controller: passwordController),
                0.032.sh.verticalSpace,
                CustomButton(
                  buttonText: "Sign Up",
                  onTap: () {
                    if (form.currentState!.validate()) {
                      print("valid");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

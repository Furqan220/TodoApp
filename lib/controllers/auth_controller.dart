import 'package:todo_app/res/export_all.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  void setLoading(v) {
    isLoading = v;
    update();
  }

  final authRepo = AuthRepository();

  //  Future<void> saveUser(dynamic user)async{
  //     await User(map: user).save();
  //     await User().init();
  // }

  // Future<void> loginApi(dynamic data,BuildContext context,{isRemember = false}) async{

  //     G.Log(data);
  //   Utils.loader(context);
  //  await  authRepo.loginApi(data).then((value){
  //     G.Log(value);

  //     saveUser(value["data"]);
  //     if (isRemember) {
  //       RememberUser(map: data).save();
  //     } else {

  //      const RememberUser().clear();
  //     }
  //     Get.back();
  //     Navigator.pushNamedAndRemoveUntil(context, RoutesName.mainHome, (route) => false);
  //     Utils.successBar(context: context, message: value["message"] as String? ?? AppString.loginSuccess);

  //   }).onError((error, stackTrace){
  //     Get.back();
  //     Utils.errorBar(context: context, message: error.toString());
  //   });

  // }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    G.Log(data);
    Utils.loader(context);
    await authRepo.signUp(data).then((value) {
      G.Log(value);
      if (value["status"]) {
        Get.back();
        Get.offNamed(RouteNames.login);
        Utils.successBar(context: context, message: value["success"]);
      } else {
        Get.back();
        Utils.successBar(context: context, message: value["error"]);
      }
    }).onError((error, stackTrace) {
      Get.back();
      Utils.errorBar(context: context, message: error.toString());
    });
  }
}

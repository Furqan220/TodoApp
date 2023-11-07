import 'package:todo_app/res/export_all.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<dynamic> signUp(dynamic data) async {
    try {
      final response = await apiServices.getPostApiResponse(AppUrl.register, data);
      return response;
    } on Exception catch (e) {
      G.Log(e);
      throw e;
    }
  }

  Future<dynamic> loginApi(dynamic data) async {
    try {
      final response = await apiServices.getPostApiResponse(AppUrl.login, data);
      return response;
    } on Exception catch (e) {
      G.Log(e);
      throw e;
    }
  }
}

import 'package:todo_app/res/export_all.dart';

class TodoRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<dynamic> getAll() async {
    try {
      final response = await apiServices.getGetApiResponse(
        AppUrl.getAllTodos + "/?userId=${User.data.id}",
      );
      return response;
    } on Exception catch (e) {
      G.Log(e);
      throw e;
    }
  }
}

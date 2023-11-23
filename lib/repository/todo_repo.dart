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
  Future<dynamic> getProgress() async {
    try {
      final response = await apiServices.getGetApiResponse(
        AppUrl.getProgress + "/?userId=${User.data.id}",
      );
      return response;
    } on Exception catch (e) {
      G.Log(e);
      throw e;
    }
  }

  Future<dynamic> create(dynamic data) async {
    try {
      final response =
          await apiServices.getPostApiResponse(AppUrl.create, data);
      return response;
    } on Exception catch (e) {
      G.Log(e);
      throw e;
    }
  }

  Future<dynamic> deleteTodo(String id) async {
    try {
      final response = await apiServices
          .getDeleteApiResponse(AppUrl.deleteTodo + "/?id=$id");
      return response;
    } on Exception catch (e) {
      G.Log(e);
      throw e;
    }
  }

  Future<dynamic> updateTodo(String id, dynamic data) async {
    try {
      final response = await apiServices.getPostApiResponse(
          AppUrl.update + "/?id=${id}", data);
      return response;
    } on Exception catch (e) {
      G.Log(e);
      throw e;
    }
  }
}

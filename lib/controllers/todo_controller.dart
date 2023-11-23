import 'package:todo_app/res/export_all.dart';

class TodoController extends GetxController {
  final todoRepo = TodoRepository();
  // RxList todaysTodo = [
  //   "Daily meeting",
  //   "Pay bill",
  //   "check emails",
  //   "Lunch with family",
  //   "Snacks with Rafi",
  //   "Gym",
  // ].obs;
  Rx<List<TodoModel>> allTodos = Rx([]);
  Rx<List<TodoModel>> todaysTodos = Rx([]);
  Rx<List<TodoModel>> olderTodos = Rx([]);
  Rx<List<ProgressModel>> progressList = Rx([]);

  Future<Rx<List<TodoModel>>>? getTodos;
  Future<Rx<List<ProgressModel>>>? progress;

  Future<Rx<List<TodoModel>>> getAllTodos(
      Rx<List<TodoModel>> allTodos, BuildContext context) async {
    await todoRepo.getAll().then((value) {
      G.Log(value);
      if (value["status"]) {
        if (value["data"].length > 0) {
          progress = getProgress(progressList, context);
        }
        allTodos.value.clear();
        todaysTodos.value.clear();
        olderTodos.value.clear();
        for (var element in value["data"]) {
          allTodos.value.add(TodoModel(map: element));
          final bool isToday = HelperFunctions.isDifferenceLessThan24Hours(
              element['createdAt'].toString(),
              DateTime.now().toUtc().toString());
          // G.Log(isToday);
          if (isToday) {
            todaysTodos.value.add(TodoModel(map: element));
          } else {
            olderTodos.value.add(TodoModel(map: element));
          }
        }
        update(["todoList"]);
      }
    }).onError((error, stackTrace) {
      G.Log(error);
      Utils.errorBar(context: context, message: error.toString());
    });
    return allTodos;
  }

  Future<Rx<List<ProgressModel>>> getProgress(
      Rx<List<ProgressModel>> progresses, BuildContext context) async {
    await todoRepo.getProgress().then((value) {
      G.Log(value);
      if (value["status"]) {
        progresses.value.clear();
        for (var element in value["data"]) {
          progresses.value.add(ProgressModel(map: element));
        }
        update(["todoList"]);
      }
    }).onError((error, stackTrace) {
      G.Log(error);
      Utils.errorBar(context: context, message: error.toString());
    });
    return progresses;
  }

  Future<void> createTodo(dynamic data, BuildContext context) async {
    Utils.loader(context);
    await todoRepo.create(data).then((value) {
      if (value['status']) {
        Get.back();
        Utils.successBar(context: context, message: value["success"]);
        getTodos = getAllTodos(allTodos, context);
      } else {
        Get.back();
        Utils.successBar(context: context, message: value["error"]);
      }
    }).onError((error, stackTrace) {
      G.Log(error);
      Get.back();
      Utils.errorBar(context: context, message: error.toString());
    });
  }

  Future<void> deleteTodo(String id, BuildContext context) async {
    Utils.loader(context);
    await todoRepo.deleteTodo(id).then((value) {
      if (value['status']) {
        Get.back();
        Utils.successBar(context: context, message: value["success"]);
        getTodos = getAllTodos(allTodos, context);
      } else {
        Get.back();
        Utils.successBar(context: context, message: value["error"]);
      }
    }).onError((error, stackTrace) {
      G.Log(error);
      Get.back();
      Utils.errorBar(context: context, message: error.toString());
    });
  }

  Future<void> updateTodo(String id, dynamic data, BuildContext context) async {
    // Utils.loader(context);
    await todoRepo.updateTodo(id, data).then((value) {
      if (value['status']) {
        // Get.back();
        Utils.successBar(context: context, message: value["success"]);
        getTodos = getAllTodos(allTodos, context);
      } else {
        // Get.back();
        Utils.successBar(context: context, message: value["error"]);
      }
    }).onError((error, stackTrace) {
      G.Log(error);
      // Get.back();
      Utils.errorBar(context: context, message: error.toString());
    });
  }
}

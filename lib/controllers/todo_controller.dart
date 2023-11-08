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

  Future<Rx<List<TodoModel>>>? getTodos;

  Future<Rx<List<TodoModel>>> getAllTodos(
      Rx<List<TodoModel>> allTodos, BuildContext context) async {
    await todoRepo.getAll().then((value) {
      G.Log(value);
      if (value["status"]) {
        allTodos.value.clear();
        todaysTodos.value.clear();
        olderTodos.value.clear();
        for (var element in value["data"]) {
          allTodos.value.add(TodoModel(map: element));
          final bool isToday = HelperFunctions.isDifferenceLessThan24Hours(
              element['createdAt'].toString(),
              DateTime.now().toUtc().toString());
          G.Log(isToday);
          if (isToday) {
            todaysTodos.value.add(TodoModel(map: element));
          } else {
            olderTodos.value.add(TodoModel(map: element));
          }
        }

        Utils.successBar(
            context: context, message: "Todos Fetched Successfully");
      }
    }).onError((error, stackTrace) {
      G.Log(error);
      Utils.errorBar(context: context, message: "Something went wrong");
    });
    return allTodos;
  }
}

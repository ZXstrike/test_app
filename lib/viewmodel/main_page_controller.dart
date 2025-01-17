import 'package:flutter/material.dart';
import 'package:test_app/model/todo_model.dart';
import 'package:test_app/utils/const/route_name.dart';
import 'package:test_app/utils/db/db.dart';

class MainPageController extends ChangeNotifier {
  late final DatabaseHelper _databaseHelper;
  List<TodoModel> todoList = [];

  MainPageController() {
    _databaseHelper = DatabaseHelper();
    getTodoList();
  }

  void getTodoList() async {
    todoList = await _databaseHelper.getTodos();
    notifyListeners();
  }

  void navigateToInputPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      RouteName.input,
    );

    notifyListeners();
  }

  void checkTodoList(int index, bool value) {
    todoList[index].isDone = !todoList[index].isDone;
    _databaseHelper.updateTodo(todoList[index]);
    notifyListeners();
  }
}

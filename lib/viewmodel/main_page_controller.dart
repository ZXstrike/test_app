import 'package:flutter/material.dart';
import 'package:test_app/model/todo_model.dart';
import 'package:test_app/utils/const/route_name.dart';

class MainPageController extends ChangeNotifier {
  List<TodoModel> todoList = [
    TodoModel(
      title: 'Makan',
      description: 'Makan nasi goreng',
      isDone: false,
    ),
    TodoModel(
      title: 'Minum',
      description: 'Minum air putih',
      isDone: false,
    ),
  ];

  void navigateToInputPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      RouteName.input,
    ).then(
      (value) {
        if (value != null) {
          todoList.add(value as TodoModel);
          notifyListeners();
        }
      },
    );

    notifyListeners();
  }

  void checkTodoList(int index, bool value) {
    todoList[index].isDone = !todoList[index].isDone;
    notifyListeners();
  }
}

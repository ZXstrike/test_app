import 'package:flutter/material.dart';
import 'package:test_app/model/todo_model.dart';
import 'package:test_app/view/page/input_page.dart';

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HalamanInputTodo(),
      ),
    ).then(
      (value) {
        if (value != null) {
          todoList.add(value);
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

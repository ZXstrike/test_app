import 'package:flutter/material.dart';
import 'package:test_app/model/todo_model.dart';
import 'package:test_app/utils/db/db.dart';

class InputPageController extends ChangeNotifier {
  late DatabaseHelper _databaseHelper;

  InputPageController() {
    _databaseHelper = DatabaseHelper();
  }

  TextEditingController judul = TextEditingController();
  TextEditingController deskripsi = TextEditingController();

  void clearText() {
    judul.clear();
    deskripsi.clear();
    notifyListeners();
  }

  void saveDataAndBack(BuildContext context) {
    final TodoModel todo = TodoModel(
      title: judul.text,
      description: deskripsi.text,
      isDone: false,
    );

    _databaseHelper.insertTodo(todo);

    Navigator.pop(context);

    clearText();
  }
}

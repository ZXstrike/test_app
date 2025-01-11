import 'package:flutter/material.dart';
import 'package:test_app/model/todo_model.dart';

class InputPageController extends ChangeNotifier {
  TextEditingController judul = TextEditingController();
  TextEditingController deskripsi = TextEditingController();

  void clearText() {
    judul.clear();
    deskripsi.clear();
    notifyListeners();
  }

  void saveDataAndBack(BuildContext context) {
    print('Judul: ${judul.text}');
    print('Deskripsi: ${deskripsi.text}');
    Navigator.pop(
      context,
      TodoModel(
        title: judul.text,
        description: deskripsi.text,
        isDone: false,
      ),
    );

    clearText();
  }
}

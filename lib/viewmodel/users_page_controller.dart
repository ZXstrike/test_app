import 'package:flutter/material.dart';
import 'package:test_app/model/users_model.dart';
import 'package:test_app/utils/rest_api/rest_api_utils.dart';

class UsersPageController extends ChangeNotifier {
  UsersModel usersList = UsersModel(
    data: [],
    page: 0,
    perPage: 0,
    total: 0,
    totalPages: 0,
    support: Support(text: '', url: ''),
  );

  void getUsersList() async {
    final data = await RestApiUtils.getUserList(
      page: 2,
    );

    if (data != null) {
      usersList = data;
      notifyListeners();
    }

    notifyListeners();
  }
}

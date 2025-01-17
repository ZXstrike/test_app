import 'package:flutter/material.dart';
import 'package:test_app/utils/rest_api/rest_api_utils.dart';

class RegistPageContoller extends ChangeNotifier {
  final TextEditingController username = TextEditingController();

  void clear() {
    username.clear();
  }

  void upload() async {
    await RestApiUtils.createUser(
      name: username.text,
    );
  }
}

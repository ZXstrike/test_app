import 'package:dio/dio.dart';
import 'package:test_app/model/users_model.dart';

class RestApiUtils {
  static Dio dio = Dio();

  static String baseUrl = 'https://reqres.in/api';

  static Future<UsersModel?> getUserList({int page = 1}) async {
    try {
      Response response = await dio.get('$baseUrl/users?page=$page', options: Options(headers: {'Content-Type': 'application/json', 'Authorization' : ''}));

      if (response.statusCode == 200) {
        return UsersModel.fromMap(response.data);
      } else {
        print('Failed to load data');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<void> createUser({String name = 'jhon'}) async {
    try {
      Map<String, dynamic> data = {'name': name, 'job': 'leader'};

      Response response = await dio.post('$baseUrl/users', data: data);

      if (response.statusCode == 201) {
        print('User created successfully');
      } else {
        print('Failed to create user');
      }
    } catch (e) {
      print(e);
    }
  }
}

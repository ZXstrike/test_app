import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/utils/const/route_name.dart';
import 'package:test_app/view/page/input_page.dart';
import 'package:test_app/view/page/main_page.dart';
import 'package:test_app/view/page/regist_page.dart';
import 'package:test_app/view/page/users_page.dart';
import 'package:test_app/viewmodel/input_page_controller.dart';
import 'package:test_app/viewmodel/main_page_controller.dart';
import 'package:test_app/viewmodel/regist_page_contoller.dart';
import 'package:test_app/viewmodel/users_page_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainPageController()),
        ChangeNotifierProvider(create: (context) => InputPageController()),
        ChangeNotifierProvider(create: (context) => UsersPageController()),
        ChangeNotifierProvider(create: (context) => RegistPageContoller()),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case RouteName.home:
                return MaterialPageRoute(
                    builder: (context) => const HalamanUtama());
              case RouteName.input:
                return MaterialPageRoute(
                    builder: (context) => const HalamanInputTodo());
              case RouteName.users:
                return MaterialPageRoute(
                    builder: (context) => const UsersPage());
              case RouteName.regist:
                return MaterialPageRoute(
                    builder: (context) => const RegistPage());
              default:
                return MaterialPageRoute(
                    builder: (context) => const HalamanUtama());
            }
          },
        );
      },
    );
  }
}

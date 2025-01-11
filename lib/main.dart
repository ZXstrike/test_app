import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/view/page/main_page.dart';
import 'package:test_app/viewmodel/input_page_controller.dart';
import 'package:test_app/viewmodel/main_page_controller.dart';

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
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SafeArea(
            child: const HalamanUtama(),
          ),
        );
      },
    );
  }
}

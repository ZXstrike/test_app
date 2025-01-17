import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodel/users_page_controller.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late UsersPageController controller;

  @override
  void initState() {
    super.initState();

    controller = Provider.of<UsersPageController>(context, listen: false);
    controller.getUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/regist');
        },
        child: const Icon(Icons.refresh),
      ),
      body: Consumer<UsersPageController>(
        builder: (context, value, child) => ListView.builder(
          itemCount: controller.usersList.data.length,
          itemBuilder: (context, index) {
            final data = controller.usersList.data[index];
            return ListTile(
              title: Text('${data.firstName} ${data.lastName}'),
              subtitle: Text(data.email),
            );
          },
        ),
      ),
    );
  }
}

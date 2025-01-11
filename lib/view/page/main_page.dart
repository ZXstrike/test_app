import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodel/main_page_controller.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  late MainPageController controller;

  @override
  void initState() {
    super.initState();

    controller = Provider.of<MainPageController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageController>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.navigateToInputPage(context);
          },
          child: Icon(Icons.add),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                width: double.infinity,
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Todo List',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: value.todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: InkWell(
                          onTap: () => controller.checkTodoList(
                              index, value.todoList[index].isDone),
                          child: ListTile(
                            leading: Checkbox(
                              value: value.todoList[index].isDone,
                              onChanged: (value) =>
                                  controller.checkTodoList(index, value!),
                            ),
                            title: Text(value.todoList[index].title),
                            subtitle: Text(value.todoList[index].description),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

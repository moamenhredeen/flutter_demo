import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/controllers/todolist_controller.dart';
import 'package:my_first_flutter_app/models/todo_item.dart';
import 'package:my_first_flutter_app/shared/p_drawer.dart';
import 'package:http/http.dart' as http;

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  late Future<List<TodoItem>> todoItems;
  final _todoListController = TodoListController();

  @override
  void initState() {
    super.initState();
    _todoListController.getTodoItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TodoList'),),
      drawer: PDrawer(),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              // leading: Image.network(image),
              title: Text('something'),
            );
          },
          separatorBuilder:  (BuildContext context, int index) => const Divider() ,
          itemCount:1
      ),
    );
  }
}





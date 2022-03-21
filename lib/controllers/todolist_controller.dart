import 'package:http/http.dart' as http;
import 'package:my_first_flutter_app/models/todo_item.dart';
import 'dart:convert';
import '../config.dart';

class TodoListController{

  void getTodoItems() async{
    final response = await http.get(Uri.parse("${Config.API_URL}/todo"));
    final decodedResponse = json.decode(response.body);
    print(decodedResponse);
  }

}

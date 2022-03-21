
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/screens/graphics_screen.dart';
import 'package:my_first_flutter_app/screens/home_screen.dart';
import 'package:my_first_flutter_app/screens/test2_screen.dart';
import 'package:my_first_flutter_app/screens/test_screen.dart';
import 'package:my_first_flutter_app/screens/todolist_screen.dart';
import 'package:my_first_flutter_app/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:greenTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/graphics': (context) => GraphicsScreen(),
        '/todolist': (context) => TodoListScreen()
      },
    );
  }
}

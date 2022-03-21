import 'package:flutter/material.dart';

import '../shared/p_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Prototype'),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.sunny))
          ],
        ),
        drawer: PDrawer(),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/primion.png')
                )
              ),
            ),
            Flexible(
              child: ListView(
                children: buildLinks(context),
              ),
            ),
          ],
        ));
  }

  List<Widget> buildLinks(BuildContext context) {
    Map<String, String> items_routes = {
    'TodoList': '/todolist',
    'Graphics': '/graphics',
    };

    return items_routes.entries.map((element) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Material(
          color: Color(0xFFEEEEEEE),
          child: InkWell(
            onTap: () { 
              Navigator.of(context).pushReplacementNamed(element.value);
            },
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: Image.asset('assets/${element.key}.png'), height: 100,),
                  Text(
                    element.key,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}

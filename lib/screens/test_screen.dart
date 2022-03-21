import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/shared/p_drawer.dart';


class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  double x = 100;
  double y = 100;
  bool selected = false;

  Matrix4 matrix = Matrix4.identity();
  Matrix4 zerada =  Matrix4.identity();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Test Screen'),),
      drawer: const  PDrawer(),
      body: Listener(
        onPointerDown: (event) {
          setState(() {
            selected = true;
          });
        },

        onPointerUp: (event){
          setState(() {
            selected = false;
          });
        },

        onPointerMove: (event){
          if(selected){
            setState(() {
              x += event.localDelta.dx;
              y += event.localDelta.dy;
            });
          }
        },

        child: Stack(
          children: [
            Positioned(
              left: x,
              top: y,
              child: Container(
                // color: Colors.red,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(color: selected ? Colors.red : Colors.transparent, width: 5)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

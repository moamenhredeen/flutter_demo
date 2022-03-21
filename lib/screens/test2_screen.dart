import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/shared/p_drawer.dart';

class Test2Screen extends StatefulWidget {
  const Test2Screen({Key? key}) : super(key: key);

  @override
  State<Test2Screen> createState() => _Test2ScreenState();
}

class _Test2ScreenState extends State<Test2Screen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Case 2 '),
      ),
      drawer: PDrawer(),
      body: InteractiveViewer(
        maxScale: 10,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              child: Image(
                image: AssetImage('assets/plan.png'),
              ),
            ),
            Positioned(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: Container(
                    color: selected ? Colors.green : Colors.red,
                    width: 50,
                    height: 50),
              ),
              top: 10,
              left: 10,
            ),
            Positioned(
              top: 200,
              left: 200,
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const Text('AlertDialog description'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

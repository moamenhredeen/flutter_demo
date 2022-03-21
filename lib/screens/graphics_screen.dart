import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/controllers/canvas_controller.dart';
import 'package:my_first_flutter_app/shared/p_drawer.dart';
import 'dart:async';

import '../models/canvas_object.dart';

class GraphicsScreen extends StatefulWidget {
  const GraphicsScreen({Key? key}) : super(key: key);

  @override
  State<GraphicsScreen> createState() => _GraphicsScreenState();
}

class _GraphicsScreenState extends State<GraphicsScreen> {

  final _controller = CanvasController();

  @override
  void initState(){
    _controller.init();
    _dummyData();
    super.initState();
  }

  @override
  void dispose(){
    _controller.close();
    super.dispose();
  }

  void _dummyData() {
    _controller.addObject(
      CanvasObject(
        dx: 20,
        dy: 20,
        width: 100,
        height: 100,
        child: Container(color: Colors.red),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CanvasController>(
      stream: _controller.stream,
      builder: (context, snapshot) {

        // if no events were sents
        if(!snapshot.hasData){
          return Scaffold(
            appBar: AppBar(title: const Text('Graphics Screen'),),
            drawer: PDrawer(),
            body: const Center(
              child: Text('Empty', style: TextStyle(color: Colors.grey, fontSize: 40),),
            ),
          );
        }

        // when receiving an event
        final instance = snapshot.data;
        // print received event
        print(instance);
        return Scaffold(
          appBar: AppBar(title: const Text('Graphics Screen'),),
          drawer: PDrawer(),
          body: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerMove: (details) {
              _controller.updateTouch(
                details.pointer,
                details.localPosition,
                details.position,
              );
            },
            onPointerDown: (details) {
              _controller.addTouch(
                details.pointer,
                details.localPosition,
                details.position,
              );
            },
            onPointerUp: (details) {
              _controller.removeTouch(details.pointer);
            },

            child: SizedBox.expand(
              child: Stack(
                children: [
                  for (final object in instance!.objects)
                    Positioned(
                      top: object.dy,
                      left: object.dx,
                      width: object.width,
                      height: object.height,
                      child: object.child,
                    ),
                ],
              ),
            ),
          ),
        );

      }
    );
  }
}



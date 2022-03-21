
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:my_first_flutter_app/models/canvas_object.dart';


class CanvasController{

  // constants
  static const double maxScale = 3.0;
  static const double minScale = 0.2;
  static const double scaleAdjust = 0.05;

  // fields
  double _scale = 1;
  Offset _offset = Offset.zero;
  final List<CanvasObject<Widget>> _objects = [];
  final _controller = StreamController<CanvasController>();

  // getters and setters
  Stream<CanvasController> get stream => _controller.stream;

  List<CanvasObject<Widget>> get objects => _objects;

  double get scale => _scale;
  set scale(double value) {
    _scale = value;
    add(this);
  }

  Offset get offset => _offset;
  set offset(Offset value){
    _offset = value;
    add(this);
  }



  void init() => add();
  void add ([CanvasController? controller]) => _controller.add(controller ?? this);
  void close() => _controller.close();

  void addObject(CanvasObject<Widget> obj) {
    _objects.add(obj);
    add(this);
  }

  void updateObject(int i, CanvasObject<Widget> obj){
    _objects[i] = obj;
    add(this);
  }

  void removeObject(int i){
    _objects.removeAt(i);
    add(this);
  }


  // Handling User Input
  void addTouch(int pointer, Offset offset, Offset globalOffset){}

  void updateTouch(int pointer, Offset offset, Offset globalOffset){}

  void removeTouch(int pointer){}


}
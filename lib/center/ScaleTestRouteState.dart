
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaleTestRouteState extends StatefulWidget{
  @override
  _ScaleTestRouteState createState() => new _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<ScaleTestRouteState>{
  double _width = 200;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("缩放"),
     ),
     body: Center(
       child: GestureDetector(
         child: Image.asset("assets/images/banner.jpg",width:_width),
         onScaleUpdate: (ScaleUpdateDetails details){
           setState(() {
             _width = 200*details.scale.clamp(.8, 10.0);
           });
         },
       ),
     ),
   );
  }
}
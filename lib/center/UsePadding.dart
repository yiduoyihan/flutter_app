import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///padding 的四个设置方式 EdgeInsets中的方法：
/// fromLTRB(double left, double top, double right, double bottom) ：分别指定四个⽅向的补⽩。
/// all(double value) : 所有⽅向均使⽤相同数值的补⽩。
/// only({left, top, right ,bottom }) ：可以设置具体某个⽅向的补⽩(可以同时指定多个⽅向)。
/// symmetric({ vertical, horizontal }) ：⽤于设置对称⽅向的补⽩，vertical指top和bottom，horizontal指left和right。

class UsePadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("简单的padding使用"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.red[50],
            padding: EdgeInsets.all(20),
            child: Text(
              "EdgeInsets.all(20)",
              style: TextStyle(backgroundColor: Colors.green[50]),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            color: Colors.red[50],
            padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
            child: Text(
              "EdgeInsets.fromLTRB(10, 20, 30, 40)",
              style: TextStyle(backgroundColor: Colors.green[50]),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            color: Colors.red[50],
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "EdgeInsets.only(top: 15)",
              style: TextStyle(backgroundColor: Colors.green[50]),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            color: Colors.red[50],
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "EdgeInsets.symmetric(vertical: 20)",
              style: TextStyle(backgroundColor: Colors.green[50]),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            color: Colors.red[50],
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "EdgeInsets.symmetric(horizontal: 20)",
              style: TextStyle(backgroundColor: Colors.green[50]),
            ),
          ),
        ],
      ),
    );
  }
}

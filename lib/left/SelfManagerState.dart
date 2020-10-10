import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 响应式的编程框架中都会有一个永恒的主题——“状态(State)管理”，无论是在React/Vue
// （两者都是支持响应式编程的Web开发框架）还是Flutter中，他们讨论的问题和解决的思想都是一致的。
// 所以，如果你对React/Vue的状态管理有了解，可以跳过本节。言归正传，我们想一个问题，
// StatefulWidget的状态应该被谁管理？Widget本身？父Widget？都会？还是另一个对象？
// 答案是取决于实际情况！以下是管理状态的最常见的方法：
//
// Widget管理自己的状态。
// Widget管理子Widget状态。
// 混合管理（父Widget和子Widget都管理状态）。
// 如何决定使用哪种管理方法？下面是官方给出的一些原则可以帮助你做决定：
//
// 如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父Widget管理。
// 如果状态是有关界面外观效果的，例如颜色、动画，那么状态最好由Widget本身来管理。
// 如果某一个状态是不同Widget共享的则最好由它们共同的父Widget管理。
class SelfManagerState extends StatefulWidget {
  @override
  _SelfManagerState createState() => new _SelfManagerState();
}

class _SelfManagerState extends State<SelfManagerState> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("自管理状态"),
      ),
      body: new GestureDetector(
        onTap: _handleTap,
        child: new Container(
          constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
          width: 200.0,
          height: 200.0,
          child: new Center(
            child: new Text(
              _active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}

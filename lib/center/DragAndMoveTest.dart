import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DragAndMoveTest extends StatefulWidget {
  @override
  _DragAndMoveTest createState() => new _DragAndMoveTest();
}

class _DragAndMoveTest extends State<DragAndMoveTest>
    with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖拽，移动"),
      ),
      body: Stack(
        children: [
          Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text("A"),
                ),
                // onPanDown: (DragDownDetails e) {
                //   print("用户手指按下：${e.globalPosition}");
                // },
                // //手指滑动时会触发此回调
                // onPanUpdate: (DragUpdateDetails e) {
                //   //用户手指滑动时，更新偏移，重新构建
                //   setState(() {
                //     _left += e.delta.dx;
                //     _top += e.delta.dy;
                //   });
                // },
                // onPanEnd: (DragEndDetails e) {
                //   //打印滑动结束时在x、y轴上的速度
                //   print(e.velocity);
                // },
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                },
              ))
        ],
      ),
    );
  }
}

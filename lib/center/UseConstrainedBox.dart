import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

///BoxConstraints⽤于设置限制条件，它的定义如下：
/// const BoxConstraints({
/// this.minWidth = 0.0, //最⼩宽度
/// this.maxWidth = double.infinity, //最⼤宽度
/// this.minHeight = 0.0, //最⼩⾼度
/// this.maxHeight = double.infinity //最⼤⾼度
/// })
///
/// BoxConstraints还定义了⼀些便捷的构造函数，⽤于快速⽣成特定限制规则的BoxConstraints，
/// 如 BoxConstraints.tight(Size size) ，它可以⽣成给定⼤⼩的限制； const BoxConstraints.expand() 可以⽣成⼀个尽可
/// 能⼤的⽤以填充另⼀个容器的BoxConstraints
///
/// 多重限制子控件最终只会取限制中数值较大的那一个。
///
/// UnconstrainedBox不会对⼦Widget产⽣任何限制，它允许其⼦Widget按照其本身⼤⼩绘制。
/// 但是父widget的大小会保持自己设置的大小。
// ignore: must_be_immutable
class UseConstrainedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("约束盒"),
      ),
      body: Column(
        children: <Widget>[
          // ConstrainedBox(
          //   constraints: BoxConstraints(
          //     minWidth: double.infinity,
          //     minHeight: 80,
          //   ),
          //   child: Container(
          //     height: 5.0, //虽然设置了5，实际上显示的仍然是80的高度
          //     child: redBox,
          //   ),
          // ),
          // ConstrainedBox(
          //   constraints: BoxConstraints.tight(Size(40, 40)),
          //   child: Container(
          //     height: 5.0, //虽然设置了5，实际上显示的仍然是80的高度
          //     child: greenBox,
          //   ),
          // ),
          // SizedBox(
          //   width: 100,
          //   height: 100,
          //   child: redBox,
          // ),
          ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //⽗
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                //⼦
                child: greenBox,
              )),
          ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0), //⽗
              child: UnconstrainedBox(
                //“去除”⽗级限制
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  //⼦
                  child: redBox,
                ),
              )),
          DecoratedBox(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 50,
          ),
          Container(
            color: Colors.black,
            child: Transform(
              alignment: Alignment.topRight, //相对于坐标系原点对应的位置
              transform: Matrix4.skewY(0.3), //沿着Y轴倾斜0.3弧度
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.deepOrange,
                child: Text("Apartment for rent"),
              ),
            ),
          ),
          Container(
            height: 20,
          ),

          ///Transform的变换是应⽤在绘制阶段，⽽并不是应⽤在布局(layout)阶段，所以⽆论对⼦widget应⽤何种变化，其占
          /// ⽤空间的⼤⼩和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.translate(
              offset: Offset(-20, -5),
              child: Text("Hello world"),
            ),
          ),
          Container(
            height: 20,
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.rotate(
              angle: math.pi / 2,
              child: Text("Hello world"),
            ),
          ),
          Container(
            height: 20,
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.scale(
              scale: 1.5, //放大到1.5倍
              child: Text("HelloWorld"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.scale(
                  scale: 1.5,
                  child: Text("HelloWord"),
                ),
              ),
              Text(
                "你好",
                style: TextStyle(color: Colors.green, fontSize: 18),
              )
            ],
          ),

          ///RotatedBox和Transform.rotate功能相似，它们都可以对⼦widget进⾏旋转变换，
          ///但是有⼀点不同：RotatedBox的变换是在layout阶段，会影响在⼦widget的位置和⼤⼩
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: RotatedBox(
              quarterTurns: 1, //旋转90°
              child: Text("HelloWorld"),
            ),
          ),
          Text(
            "你好",
            style: TextStyle(color: Colors.green, fontSize: 18),
          ),
          Container(
            constraints: BoxConstraints.tightFor(width: 200,height: 100),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.red,Colors.orange],
                center: Alignment.topLeft,
                radius: .98
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0,2.0),
                  blurRadius: 4.0
                )
              ]
            ),
            transform: Matrix4.rotationZ(.2),
            alignment: Alignment.center,
            child: Text("5.20",style: TextStyle(color: Colors.white,fontSize: 40.0),),
          ),
        ],
      ),
    );
  }

  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );
  Widget greenBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.green),
  );
}

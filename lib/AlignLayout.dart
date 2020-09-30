import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Align 组件可以调整子组件的位置，并且可以根据子组件的宽高来确定自身的的宽高
///
/// alignment : 需要一个AlignmentGeometry类型的值，表示子组件在父组件中的起始位置。
/// AlignmentGeometry 是一个抽象类，它有两个常用的子类：Alignment和 FractionalOffset
///
/// widthFactor和heightFactor是用于确定Align 组件本身宽高的属性；它们是两个缩放因子，
/// 会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。如果值为null，则组件的
/// 宽高将会占用尽可能多的空间。
//                      Y
//                     |
//                     1
//                     |
//       —————(-1)|————|————|1———————>X
//                     |
//                   (-1)
//                     |
//  偏移量是从左上角开始计算，而坐标系原点是在屏幕中心，即偏移的起点为(-1,1),而第一个的
// 位置设定为topRight的坐标为(1,-1),将这个带入下面公式计算为:
// (1*60/2+60/2,-1*60/2+60/2) = (60,0),相当于是X轴平移60而Y轴不动,其他几个同理
///
/// Alignment的偏移公式：(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
/// alignment: Alignment(2,0.0)设置为这，带入公式计算可得偏移量为（90,30）
///
/// 下面介绍下 FractionalOffset
///  FractionalOffset：继承自 Alignment，它和 Alignment唯一的区别就是坐标原点不同！
///  FractionalOffset 的坐标原点为矩形的左侧顶点，这和布局系统的一致
///  实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
///
/// Align和Stack/Positioned都可以用于指定子元素相对于父元素的偏移，
/// 但它们还是有两个主要区别：
///
/// 1.定位参考系统不同；Stack/Positioned定位的的参考系可以是父容器矩形的四个顶点；
/// 而Align则需要先通过alignment 参数来确定坐标原点，不同的alignment会对应不同原点，
/// 最终的偏移是需要通过alignment的转换公式来计算出。
/// 2.Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠。
///
class AlignLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("对齐与相对定位"),
        ),
        body: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Alignment.topRight"),
                  Container(
                      width: 120,
                      height: 120,
                      color: Colors.blue[50],
                      child: Align(
                        alignment: Alignment.topRight,
                        child: FlutterLogo(
                          size: 60,
                        ),
                      )),
                  Text("Alignment.topLeft"),
                  Container(
                      width: 120,
                      height: 120,
                      color: Colors.blue[50],
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FlutterLogo(
                          size: 60,
                        ),
                      )),
                  Text("Alignment(2, 0.0)"),
                  Container(
                      width: 120,
                      height: 120,
                      color: Colors.blue[50],
                      child: Align(
                        alignment: Alignment(2, 0.0),
                        child: FlutterLogo(
                          size: 60,
                        ),
                      )),
                  Text("省略宽高"),
                  //当widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Center(
                      child: Text("xxx"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(" Alignment.bottomLeft"),
                  Container(
                      width: 120,
                      height: 120,
                      color: Colors.blue[50],
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: FlutterLogo(
                          size: 60,
                        ),
                      )),
                  Text("Alignment.bottomRight"),
                  Container(
                      width: 120,
                      height: 120,
                      color: Colors.blue[50],
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FlutterLogo(
                          size: 60,
                        ),
                      )),
                  Text("FractionalOffset(0.5, 0.5)"),
                  Container(
                    height: 120,
                    width: 120,
                    color: Colors.blue[50],
                    child: Align(
                      //偏移量计算可得 (30,30)
                      alignment: FractionalOffset(0.5, 0.5),
                      child: FlutterLogo(
                        size: 60,
                      ),
                    ),
                  ),
                  Text(" widthFactor: 2"),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Center(
                      widthFactor: 2,
                      heightFactor: 2,
                      child: Text("xxx"),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

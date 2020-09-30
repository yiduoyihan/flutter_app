import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Android中的Frame布局是相似的，子组件可以根据距父容器四个角的位置来确定自身的位置。
///绝对定位允许子组件堆叠起来（按照代码中声明的顺序）。Flutter中使用Stack和Positioned
///这两个组件来配合实现绝对定位。Stack允许子组件堆叠，而Positioned用于根据Stack的四个
///角来确定子组件的位置。
///
/// Stack 有如下几个需要注意的属性：
///
/// alignment：此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子组件。
/// 所谓部分定位，在这里特指没有在某一个轴上定位：left、right为横轴，top、bottom为纵轴，
/// 只要包含某个轴上的一个定位属性就算在该轴上有定位。
///
/// textDirection：和Row、Wrap的textDirection功能一样，都用于确定alignment对齐的参
/// 考系，即：textDirection的值为TextDirection.ltr，则alignment的start代表左，end代
/// 表右，即从左往右的顺序；textDirection的值为TextDirection.rtl，则alignment的start
/// 代表右，end代表左，即从右往左的顺序
///
/// fit：此参数用于确定没有定位的子组件如何去适应Stack的大小。StackFit.loose表示使用
/// 子组件的大小，StackFit.expand表示扩伸到Stack的大小
///
/// overflow：此属性决定如何显示超出Stack显示空间的子组件；值为Overflow.clip时，超出
/// 部分会被剪裁（隐藏），值为Overflow.visible 时则不会。
///
/// Positioned的几个属性定义：
/// left、top 、right、 bottom分别代表离Stack左、上、右、底四边的距离。width和height
/// 用于指定需要定位元素的宽度和高度。注意，Positioned的width、height 和其它地方的意义
/// 稍微有点区别，此处用于配合left、top 、right、 bottom来定位组件，举个例子，在水平方
/// 向时，你只能指定left、right、width三个属性中的两个，如指定left和width后，right会
/// 自动算出(left+width)，如果同时指定三个属性则会报错，垂直方向同理。
///
class StackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          fit: StackFit.expand, //未定位widget占满Stack整个空间，这样第二个会覆盖掉第一个
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 19,
              child: Text("I am jack ma"),
            ),
            Container(
              color: Colors.red,
              child: Text(
                "Hello world",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Positioned(
              top: 19,
              child: Text("I am jack ma = 我是土豪"),
            ),
          ],
        ),
      ),
    );
  }
}

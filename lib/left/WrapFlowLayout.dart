import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///在Row和Colum时，如果子widget超出屏幕范围，则会报溢出错误 因为row死脑筋只会一行，不会
///自动换行，所以超出屏幕长度则会报错。
///
/// wrap 区别于 row和column的参数
/// spacing：主轴方向子widget的间距
/// runSpacing：纵轴方向的间距
/// runAlignment：纵轴方向的对齐方式
///
/// 至于flow 书上说过于复杂，
/// 优点：
///
/// 性能好；Flow是一个对子组件尺寸以及位置调整非常高效的控件，Flow用转换矩阵在对子组件进
/// 行位置调整的时候进行了优化：在Flow定位过后，如果子组件的尺寸或者位置发生了变化，在
/// FlowDelegate中的paintChildren()方法中调用context.paintChild 进行重绘，而
/// context.paintChild在重绘时使用了转换矩阵，并没有实际调整组件位置。
///
/// 灵活；由于我们需要自己实现FlowDelegate的paintChildren()方法，所以我们需要自己计算
/// 每一个组件的位置，因此，可以自定义布局策略。
///
/// 缺点：
///
/// 使用复杂。
/// 不能自适应子组件大小，必须通过指定父容器大小或实现TestFlowDelegate的getSize返回固定大小。
class WrapFlowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("流式布局"),
        ),
        body: Wrap(
          spacing: 20,
          runSpacing: 5,
          alignment: WrapAlignment.center,
          children: <Widget>[
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('A')),
              label: new Text('Hamilton'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('M')),
              label: new Text('Lafayette'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('H')),
              label: new Text('Mulligan'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('J')),
              label: new Text('Laurens'),
            ),
            Flow(
                delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                children: <Widget>[
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.red,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.green,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.blue,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.yellow,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.brown,
                  ),
                  new Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.purple,
                  ),
                ])
          ],
        ));
  }
}


class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

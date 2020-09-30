import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///弹性布局允许子组件按照一定比例来分配父容器空间
///
///    Flex组件可以沿着水平或垂直方向排列子组件（用direction来控制方向），如果你知道
/// 主轴方向，使用Row或Column会方便一些，因为Row和Column都继承自Flex，参数基本相同，
/// 所以能使用Flex的地方基本上都可以使用Row或Column
///
///   Expanded可以按比例“扩伸” Row、Column和Flex子组件所占用的空间。
///
///   flex参数为弹性系数，如果为0或null，则child是没有弹性的，即不会被扩伸占用的空间。
///如果大于0，所有的Expanded按照其flex的比例来分割主轴的全部空闲空间
class FlexLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局体验"),
      ),
      body: Column(
        children: <Widget>[
          //两个Flex按1：2排列
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100.0,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.yellow,
                    height: 30,
                  ),
                ),
                //Spacer是Expanded的一个包装类
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

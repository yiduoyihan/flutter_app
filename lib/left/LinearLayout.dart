import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///   所谓线性布局，即指沿水平或垂直方向排布子组件。Flutter中通过Row和Column来实现线性布局，
///类似于Android中的LinearLayout控件。Row和Column都继承自Flex
///
/// 主轴和纵轴【我觉得叫主轴和副轴比较好，毕竟自身方向为主轴，非自身方向为副轴，好理解】
///
///     对于线性布局，有主轴和纵轴之分，如果布局是沿水平方向，那么主轴就是指水平方向，而
/// 纵轴即垂直方向；如果布局沿垂直方向，那么主轴就是指垂直方向，而纵轴就是水平方向。在线
/// 性布局中，有两个定义对齐方式的枚举类MainAxisAlignment和CrossAxisAlignment，分别代
/// 表主轴对齐和纵轴对齐。
///
/// textDirection: TextDirection.rtl/ltr (子组件的排列顺序是 ltr（left to right）
/// 还是rtl（right to left）,默认不设置的话是rtl，即从左到右)
///
/// mainAxisSize: MainAxisSize.max/min(代表组件在主轴方向的长度是充满屏幕还是只包裹里面的
/// 子组件，即对Row组件来说代表的是宽度，对Column组件来说代表的是高度，默认不设置时为max)
///
///  mainAxisAlignment: MainAxisAlignment.center 表示子组件在父组件（Row/Column）中
///  的主轴位置上居中，也可设置start/end 属性，但是只有在Row/Column的mainAxisSize为max才有效
///
///  verticalDirection: VerticalDirection.up/down,表示子组件在父组件（Row/Column）中
///  的相对位置关系，即在Row中子组件是上边界对齐(down)，还是下边界对齐(up),在Column中是
///  是组件按从上到下的顺序排还是从底部往上排
///
/// crossAxisAlignment: CrossAxisAlignment.start,和 mainAxisAlignment对应，表示在
/// 副轴上的位置关系，同样有start center end 等等相关属性可以设置。此属性也为副轴不是min
/// 才有意义
class LinearLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局测试"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("hello"),
              Text(" jack ma "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("hello"),
              Text(" jack ma "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text("hello"),
              Text(" jack ma "),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(
                "hello",
                style: TextStyle(fontSize: 30),
              ),
              Text(" jack ma "),
            ],
          ),
          //弹性布局组件
          Expanded(
            child: Container(
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text("hello"),
                            Text(" jack ma "),
                            Text(" jack ma " * 2),
                            Text(" jack ma " * 3),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

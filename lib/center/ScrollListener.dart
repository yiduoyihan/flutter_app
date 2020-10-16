import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollListener extends StatefulWidget {
  @override
  _ScrollListener createState() => new _ScrollListener();
}

class _ScrollListener extends State<ScrollListener> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //返回顶部按钮默认不显示
  String _progress = "0%"; //保存进度百分比

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表滑动监听"),
      ),
      body: Scrollbar(
        ///ScrollNotification，它包括一个metrics属性，它的类型是ScrollMetrics，该属
        ///性包含当前ViewPort及滚动位置等信息：
        // pixels：当前滚动位置。
        // maxScrollExtent：最大可滚动长度。
        // extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
        // extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
        // extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
        // atEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）。
        child: NotificationListener<ScrollNotification>(
            // ignore: missing_return
            onNotification: (ScrollNotification notification) {
              double progress = notification.metrics.pixels /
                  notification.metrics.maxScrollExtent;
              setState(() {
                _progress = "${(progress * 100).toInt()}%";
              });
              print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                ListView.builder(
                    itemCount: 100,
                    itemExtent: 50,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text("列表项$index"));
                    }),
                CircleAvatar(
                  radius: 30,
                  child: Text(_progress),
                  backgroundColor: Colors.black54,
                )
              ],
            )),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              }),
    );
  }
}

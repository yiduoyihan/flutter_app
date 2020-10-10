import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//指示进度器
class ProgressBar extends StatefulWidget {
  @override
  _ProgressBar createState() => new _ProgressBar();
}

class _ProgressBar extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("进度指示器"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.green),
              value: .5,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: ColorTween(begin: Colors.green, end: Colors.red)
                  .animate(_animationController),
              value: _animationController.value,
              // strokeWidth: 10,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
              // strokeWidth: 15,
            ),
            // 线性进度条高度指定为3
            SizedBox(
              height: 30,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ),
            // 圆形进度条直径指定为100
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
              ),
            ),
            // 宽高不等
            SizedBox(
              height: 100,
              width: 130,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

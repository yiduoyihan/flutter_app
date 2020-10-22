import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationTest extends StatefulWidget {
  @override
  _NotificationTest createState() => new _NotificationTest();
}

class _NotificationTest extends State<NotificationTest> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter中的Notification"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "   ";
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Builder(builder: (context) {
                return RaisedButton(
                  onPressed: () => MyNotification("hello").dispatch(context),
                  child: Text("点我发送通知"),
                );
              }),
              Text(_msg),
            ],
          ),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}

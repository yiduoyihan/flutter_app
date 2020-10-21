import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("对话框测试"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
              child: Text("删除对话框"),
              onPressed: () async {
                //弹出对话框并等待其关闭
                bool delete = await showDeleteConfirmDialog1(context);
              }),
          RaisedButton(
            onPressed: () => changeLanguage(context),
            child: Text("SimpleDialog"),
          ),
          RaisedButton(
            onPressed: () => showListDialog(context),
            child: Text("showListDialog"),
          ),
          RaisedButton(
            child: Text("显示底部菜单列表"),
            onPressed: () => _showModalBottomSheet(context),
          ),
          RaisedButton(
            child: Text("全屏对话框"),
            onPressed: () => _showBottomSheet(context),
          ),
          RaisedButton(
            child: Text("loadingDialog"),
            onPressed: () => showLoadingDialog(context),
          ),
          RaisedButton(
            child: Text("自定义宽dialog"),
            onPressed: () => showCustomWidthDialog(context),
          ),
          RaisedButton(
            child: Text("日历dialog"),
            onPressed: () => showDateDialog(context),
          ),
        ],
      ),
    );
  }

// 弹出对话框
  Future<bool> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> changeLanguage(BuildContext context) async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> showListDialog(BuildContext context) async {
    int index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  // 弹出底部菜单列表模态对话框
  Future<int> _showModalBottomSheet(BuildContext context) async {
    int index = await showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  // 返回的是一个controller
  PersistentBottomSheetController<int> _showBottomSheet(BuildContext context) {
    return showBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text("$index"),
                onTap: () {
                  // do something
                  print("$index");
                  Navigator.of(context).pop();
                });
          },
        );
      },
    );
  }

  showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );
      },
    );
  }

  showCustomWidthDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, //点击遮罩不关闭对话框
        builder: (context) {
          return UnconstrainedBox(
              constrainedAxis: Axis.vertical,
              child: SizedBox(
                width: 280,
                child: AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(
                          // value: .8,
                          ),
                      Padding(
                        padding: const EdgeInsets.only(top: 26.0),
                        child: Text("正在加载，请稍后..."),
                      )
                    ],
                  ),
                ),
              ));
        });
  }

  Future<DateTime> showDateDialog(BuildContext context) {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        //未来30天可选
        Duration(days: 30),
      ),
    );
  }
}
